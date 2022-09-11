import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout/shop_layout_screen.dart';
import 'package:shop_app/modules/login/cubit/login_cubit.dart';
import 'package:shop_app/modules/login/cubit/login_state.dart';
import 'package:shop_app/modules/login/sign_up.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cash_helper.dart';
import 'package:shop_app/shared/styles/colors.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var screenColor = defaultColor[900];
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status != false) {
              print(state.loginModel.status);
              print(state.loginModel.message);
              print(state.loginModel.data?.token);
              CashHelper.putData(
                      key: 'token', value: state.loginModel.data?.token)
                  .then((value) {
                replaceTo(
                  context,
                  HomeLayout(),
                );
              });
              showToast(
                message: state.loginModel.message!,
                state: ToastStates.success,
              );
            } else {
              print(state.loginModel.status);
              print(state.loginModel.message);
              showToast(
                message: state.loginModel.message!,
                state: ToastStates.error,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: screenColor,
            appBar: AppBar(
              backgroundColor: screenColor,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Image(
                      width: 60,
                      height: 60,
                      image: AssetImage(
                        'assets/images/hicon.png',
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: screenHeight - 200,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadiusDirectional.all(
                                    Radius.circular(15)),
                                color: screenColor,
                              ),
                              width: MediaQuery.of(context).size.width - 330,
                              height: 5,
                            ),
                            const Spacer(),
                            const Text(
                              'Create Account',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Hello there! please create an account to continue',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller: emailController,
                              label: 'Email',
                              prefix: Icons.email_rounded,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter Email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller: passwordController,
                              label: 'Password',
                              onSubmit: (value) {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              type: TextInputType.visiblePassword,
                              isPassword: LoginCubit.get(context).isPassword,
                              prefix: Icons.lock_rounded,
                              suffixIcon: LoginCubit.get(context).suffix,
                              suffixOnPress: () {
                                LoginCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context) => defaultMaterialButton(
                                height: 50.0,
                                width: MediaQuery.of(context).size.width - 100,
                                borderRadius: 10.0,
                                // ignore: void_checks
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: "Sign In",
                                color: screenColor,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              fallback: (context) => CircularProgressIndicator(
                                color: screenColor,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      color: screenColor!.withOpacity(0.6)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    navigateTo(context, SignUpScreen());
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: screenColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Spacer()
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
