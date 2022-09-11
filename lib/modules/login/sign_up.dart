import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/sign_in.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/styles/colors.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneNumberController = TextEditingController();
  bool isPass = true;
  var screenColor = defaultColor[900];
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
                        controller: usernameController,
                        label: 'Username',
                        prefix: Icons.person_rounded,
                      ),
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
                      defaultFormField(
                        controller: phoneNumberController,
                        label: 'Phone Num.',
                        prefix: Icons.phone_iphone_rounded,
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      defaultMaterialButton(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width - 100,
                        borderRadius: 10.0,
                        onPressed: () {},
                        text: "SignUp Now...",
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
                            'already have an account?',
                            style: TextStyle(color: screenColor!.withOpacity(0.6)),
                          ),
                          TextButton(
                            onPressed: () {
                              navigateTo(context, SignInScreen());
                            },
                            child:  Text(
                              'Sign in',
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
