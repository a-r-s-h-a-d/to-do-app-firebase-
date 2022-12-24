import 'package:flutter/material.dart';
import 'package:todo_app/presentation/home/screen_home.dart';
import 'package:todo_app/presentation/sign_in/widgets/signup_google_phone_button.dart';
import 'package:todo_app/presentation/sign_in/widgets/textitem.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:todo_app/presentation/sign_up/screen_signup.dart';

class ScreenSignInPage extends StatefulWidget {
  const ScreenSignInPage({super.key});

  @override
  State<ScreenSignInPage> createState() => _ScreenSignInPageState();
}

class _ScreenSignInPageState extends State<ScreenSignInPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool circular = false;

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
              textItem(context, 'Email', emailController, false),
              const SizedBox(height: 15),
              textItem(context, 'Password', pwdController, true),
              const SizedBox(height: 30),
              colorButton('Sign In'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "if you don't have an account?  ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ScreenSignUpPage(),
                    )),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
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

  Widget colorButton(String buttonName) {
    return InkWell(
      onTap: () async {
        setState(() {
          circular = true;
        });
        try {
          firebase_auth.UserCredential userCredential =
              await firebaseAuth.signInWithEmailAndPassword(
                  email: emailController.text, password: pwdController.text);
          // ignore: avoid_print
          print(userCredential.user!.email);
          setState(() {
            circular = false;
          });
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const ScreenHome(),
              ),
              (route) => false);
        } catch (e) {
          final snackbar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          setState(() {
            circular = false;
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 90,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color(0xfffd746c),
              Color(0xffff9868),
              Color(0xfffd746c),
            ],
          ),
        ),
        child: Center(
          child: circular
              ? const CircularProgressIndicator()
              : Text(
                  buttonName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
        ),
      ),
    );
  }
}
