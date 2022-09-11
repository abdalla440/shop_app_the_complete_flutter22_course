import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/app.dart';
import 'package:shop_app/layout/shop_layout/shop_layout_screen.dart';
import 'package:shop_app/modules/login/login.dart';
import 'package:shop_app/modules/on_boarding/on_boarding_screen.dart';
import 'package:shop_app/shared/bloc_observer.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/local/cash_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  Widget startWidget;
  var isOnBoarding = CashHelper.getData(key: 'onBoarding');
  token = CashHelper.getData(key: 'token');

  if (isOnBoarding != null) {
    if (token != null) {
      startWidget = HomeLayout();
    } else {
      startWidget = LoginScreen();
    }
  } else {
    startWidget = OnBoardingScreen();
  }
  BlocOverrides.runZoned(
    () {
      runApp(App(
        startWidget: startWidget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}
