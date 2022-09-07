import 'package:flutter/material.dart';
import 'package:shop_app/modules/on_boarding/on_boarding_screen.dart';
import 'package:shop_app/shared/styles/themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  OnBoardingScreen(),
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
