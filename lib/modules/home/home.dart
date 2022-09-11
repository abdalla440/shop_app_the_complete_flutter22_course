import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout/cubit/shop_cubit.dart';
import 'package:shop_app/models/shop_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..getHomeData(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: ShopCubit.get(context).homeModel != null,
            builder: (context) {
              return HomeBuilder(ShopCubit.get(context).homeModel!);
            },
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Widget HomeBuilder(HomeModel model) => Column(
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
        ],
      );
}
