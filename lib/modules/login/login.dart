import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/sign_in.dart';
import 'package:shop_app/modules/login/sign_up.dart';
import 'package:shop_app/shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/blueBackground.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: bigLogo(),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    height: 50.0,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        navigateTo(
                          context,
                          SignUpScreen(),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blue[800],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already have an account?',
                        style: TextStyle(color: Colors.white.withOpacity(0.6)),
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(
                            context,
                            SignInScreen(),
                          );
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
