import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout/cubit/shop_cubit.dart';
import 'package:shop_app/models/cotegories_model.dart';
import 'package:shop_app/shared/styles/colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..getCategoriesData(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: ShopCubit.get(context).categoriesModel != null,
            builder: (context) {
              return categoriesBuilder(ShopCubit.get(context).categoriesModel!);
            },
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Widget categoriesBuilder(CategoriesModel model) {
    return Container(
      color: defaultColor[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 1 / 1.3,
            children: List.generate(model.data!.data.length,
                (index) => categoriesItemBuilder(model.data!.data[index]))),
      ),
    );
  }

  Widget categoriesItemBuilder(DataModel dataModel) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              '${dataModel.name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
            Image(
                height: 100,
                width: double.infinity,
                image: NetworkImage('${dataModel.image}')),
          ],
        ),
      ),
    );
  }
}
