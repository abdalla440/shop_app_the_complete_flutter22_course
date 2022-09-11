import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/modules/login/cubit/login_state.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  LoginModel? loginModel ;
  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(
      LoginLoadingState(),
    );
    await DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then(
      (value) {
        loginModel = LoginModel.fromJson(value.data);
        emit(LoginSuccessState(loginModel!));
      },
    ).catchError(
      (error) {
        emit(LoginErrorState(error.toString()));
        print(error);
      },
    );
  }

  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;
    emit(LoginChangePasswordVisibilityState());
  }
}
