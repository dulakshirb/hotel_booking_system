import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/screens/auth/sign_in_screen.dart';
import 'package:hotel_booking_app/screens/auth/sign_up_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignInPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSignInPage ? const SignIn() : const SignUp(),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: isSignInPage
                          ? 'You don\'t have an account? '
                          : 'Already you have an account? ',
                      style: const TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                        text: isSignInPage ? 'Sign Up' : 'Sign In',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              isSignInPage = !isSignInPage;
                            });
                          }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
