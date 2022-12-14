import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout/cubit/shop_cubit.dart';
import 'package:shop_app/models/cotegories_model.dart';
import 'package:shop_app/models/shop_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()
        ..getHomeData()
        ..getCategoriesData(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: ShopCubit.get(context).homeModel != null &&
                ShopCubit.get(context).categoriesModel != null,
            builder: (context) {
              return HomeBuilder(ShopCubit.get(context).homeModel!,
                  ShopCubit.get(context).categoriesModel!);
            },
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Widget HomeBuilder(HomeModel model, CategoriesModel categoriesModel) =>
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: Colors.grey[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: model.data?.banners
                    .map(
                      (element) => Image(
                        image: NetworkImage(
                          '${element.image}',
                        ),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: 250.0,
                  initialPage: 0,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  pauseAutoPlayOnManualNavigate: true,
                  viewportFraction: 1.0,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Top Categories',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        CategoryItemBuilder(categoriesModel.data!.data[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 0,
                    ),
                    itemCount: categoriesModel.data!.data.length,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.grey[100],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Hot Deals',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 1 / 1.62,
                        children:
                            List.generate(model.data!.products.length, (index) {
                          print(model.data!.products.length);
                          return ListItemBuilder(model.data!.products[index]);
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget CategoryItemBuilder(
    DataModel model,
  ) =>
      Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image(
                height: 100,
                width: 100,
                image: NetworkImage(
                  '${model.image}',
                ),
              ),
              Text(
                '${model.name}',
              ),
            ],
          ),
        ),
      );

  Widget ListItemBuilder(ProductsData model) => Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image(
                  image: NetworkImage('${model.image}'),
                  width: double.infinity,
                  height: 200,
                ),
                if (model.discount != 0)
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      'DISCOUNT',
                      style: TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.name!}\n',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'EGP ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                '${model.price.round()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          if (model.discount != 0)
                            Row(
                              children: [
                                Text(
                                  'EGP ${model.oldPrice.round()}',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${model.discount.round()}% OFF',
                                  style: TextStyle(
                                    color: Colors.green[700],
                                    wordSpacing: 0,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border_rounded),
                        padding: EdgeInsets.zero,
                        iconSize: 25.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
