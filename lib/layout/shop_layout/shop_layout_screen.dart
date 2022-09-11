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
          return Scaffold(
            appBar: AppBar(
              backgroundColor: defaultColor[900],
              title: Image(
                image: AssetImage(
                  'assets/images/hiconfull0.png',
                ),
                height: 20,
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
