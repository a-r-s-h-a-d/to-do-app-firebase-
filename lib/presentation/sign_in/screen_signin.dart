import 'package:flutter/material.dart';
import 'package:todo_app/presentation/widgets/signup_button.dart';
import 'package:todo_app/presentation/widgets/signup_google_phone_button.dart';
import 'package:todo_app/presentation/widgets/textitem.dart';

class ScreenSignInPage extends StatelessWidget {
  const ScreenSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const SignUpButton(
                  buttonName: 'Continue with Google',
                  imagePath: 'asset/google.svg',
                  size: 25),
              const SizedBox(height: 15),
              const SignUpButton(
                  buttonName: 'Continue with Mobile',
                  imagePath: 'asset/phone.svg',
                  size: 25),
              const SizedBox(height: 15),
              const Text(
                'Or',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 15),
              textItem(context, 'Email'),
              const SizedBox(height: 15),
              textItem(context, 'Password'),
              const SizedBox(height: 30),
              colorButton(context, 'Sign In'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "if you don't have an account?  ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Forgot Password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
