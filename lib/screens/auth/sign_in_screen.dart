import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/widgets/custom_button.dart';
import 'package:hotel_booking_app/widgets/custom_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? emailErrorText;
  String? passwordErrorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Sign In',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          controller: emailController,
          textFieldName: 'Email',
          errorText: emailErrorText,
        ),
        CustomTextField(
          controller: passwordController,
          textFieldName: 'Password',
          errorText: passwordErrorText,
        ),
        CustomButton(
          btnText: 'Sign In',
          onTap: () {
            signIn();
          },
        ),
      ],
    );
  }

  Future signIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        setState(() {
          emailErrorText = 'Invalid Credentials';
          passwordErrorText = 'Invalid Credentials';
        });
      } else {
        print('wrong way');
      }
    }

    // print(credential);
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
