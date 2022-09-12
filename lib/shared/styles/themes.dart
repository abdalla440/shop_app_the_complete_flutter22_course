import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/shared/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    systemOverlayStyle:SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white),
  ),
  primarySwatch: defaultColor,
);
ThemeData darkTheme = ThemeData();
