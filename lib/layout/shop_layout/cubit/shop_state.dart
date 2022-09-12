part of 'shop_cubit.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}

class ChangeBottomNavBarState extends ShopState {}

class ShopHomeLoadingState extends ShopState {}

class ShopHomeSuccessState extends ShopState {}

class ShopHomeErrorState extends ShopState {}


class ShopCategoriesSuccessState extends ShopState {}

class ShopCategoriesErrorState extends ShopState {}