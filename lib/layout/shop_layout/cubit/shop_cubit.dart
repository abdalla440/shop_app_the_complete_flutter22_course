import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/models/shop_model.dart';
import 'package:shop_app/modules/cart/search.dart';
import 'package:shop_app/modules/categories/categories.dart';
import 'package:shop_app/modules/home/home.dart';
import 'package:shop_app/modules/profile/profile.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/local/cash_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());
  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List screens = [
    HomeScreen(),
    CategoriesScreen(),
    ProfileScreen(),
    CartScreen(),
  ];
  List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.category_outlined),
      label: 'categories',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline_rounded),
      label: 'Profile',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: 'Cart',
    ),
  ];
  void changeNavBarCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  HomeModel? homeModel;
  void getHomeData() {
    emit(ShopHomeLoadingState());
    DioHelper.getData(
      url: HOME,
      token: CashHelper.getData(key: token)
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel?.data!.products[0].description);
      emit(ShopHomeSuccessState());
    }).catchError((error) {
      print(error);
      emit(ShopHomeErrorState());
    });
  }
}
