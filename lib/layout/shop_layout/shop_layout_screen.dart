import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout/cubit/shop_cubit.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          ShopCubit cubit = ShopCubit.get(context);
          List<BottomNavigationBarItem> bottomNavBarItems =
              cubit.bottomNavBarItems;
          int currentIndex = cubit.currentIndex;
          TextEditingController? searchController;
          return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: nanoLogo(),
              ),
              leadingWidth: 100,
              title: SizedBox(
                height: 35,
                child: TextFormField(
                  controller: searchController,
                  onFieldSubmitted: (value) {},
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'What are you looking for?',
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    prefixIcon: const Icon(Icons.search_rounded),
                  ),
                ),
              ),
            ),
            body: cubit.screens[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: defaultColor[900],
              unselectedItemColor: Colors.grey,
              currentIndex: currentIndex,
              items: bottomNavBarItems,
              onTap: (value) => cubit.changeNavBarCurrentIndex(value),
            ),
          );
        },
      ),
    );
  }
}
