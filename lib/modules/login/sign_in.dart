import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/sign_up.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/styles/colors.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPass = true;
  var screenColor = defaultColor[700];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

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
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.all(Radius.circular(15)),
                          color: screenColor,

                        ),
                        width:MediaQuery.of(context).size.width - 330,
                        height: 5,
                      ),
                      Spacer(),
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
                      SizedBox(
                        height: 15,
                      ),
                      // Text(
                      //   'Username',
                      //   style: TextStyle(
                      //       color: screenColor,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 16),
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                        controller: emailController,
                        label: 'Email',
                        prefix: Icons.email_rounded,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                          controller: passwordController,
                          label: 'Password',
                          prefix: Icons.lock_rounded,
                          suffixIcon: Icons.remove_red_eye
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultMaterialButton(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width - 100,
                        borderRadius: 10.0,
                        onPressed: () {},
                        text: "Sign In",
                        color: screenColor,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(color: screenColor!.withOpacity(0.6)),
                          ),
                          TextButton(
                            onPressed: () {
                              navigateTo(context, SignUpScreen());
                            },
                            child:  Text(
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
                      Spacer()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// SingleChildScrollView(
// child: Container(
// height: 500,
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(20.0),
// topRight: Radius.circular(20.0),
// ),
// color: Colors.white),
// child: Form(
// child: Padding(
// padding: EdgeInsets.all(20.0),
// child: Column(
// children: [
// Text('Create Account',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 25.0,
// color: Colors.grey[900],
// )),
// Text('hello there please sign up to continue',
// style: TextStyle(
// fontWeight: FontWeight.w400,
// fontSize: 16.0,
// color: Colors.grey[700],
// )),
// SizedBox(
// height: 15.0,
// ),
// Expanded(
// child: Column(
// children: [
// defaultFormField(
// label: 'Username',
// controller: usernameController,
// ),
// SizedBox(
// height: 15.0,
// ),
// defaultFormField(
// label: 'Email',
// controller: emailController,
// ),
// SizedBox(
// height: 15.0,
// ),
// defaultFormField(
// label: 'Password',
// controller: passwordController,
// isPassword: isPass,
// suffixIcon: Icons.remove_red_eye,
// onTap: () {}),
// SizedBox(
// height: 15.0,
// ),
// defaultFormField(
// label: 'Phone Num.',
// controller: phoneNumberController,
// ),
// SizedBox(
// height: 15.0,
// ),
// Container(
// height: 50.0,
// width: double.maxFinite,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// color: Colors.blue[800],
// ),
// child: MaterialButton(
// onPressed: () {},
// child: const Text(
// 'Sign Up',
// style: TextStyle(
// fontSize: 18.0,
// color: Colors.white,
// ),
// ),
// ),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// 'already have an account?',
// style: TextStyle(
// color:
// Colors.blue.withOpacity(0.9)),
// ),
// TextButton(
// onPressed: () {},
// child: const Text(
// 'Sign in',
// style: TextStyle(
// color: Colors.blue,
// fontWeight: FontWeight.bold,
// fontSize: 16.0),
// ),
// )
// ],
// ),
// ],
// ),
// )
// ],
// ),
// ),
// ),
// ),
// )
