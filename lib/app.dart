import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout/cubit/shop_cubit.dart';
import 'package:shop_app/shared/styles/themes.dart';

class App extends StatelessWidget {
  final startWidget;
  App({Key? key, required this.startWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopCubit(),
        )
      ],
      child: MaterialApp(
        home: startWidget,
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
