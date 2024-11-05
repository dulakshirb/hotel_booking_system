import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/validation/validation.dart';
import 'package:hotel_booking_app/widgets/custom_button.dart';
import 'package:hotel_booking_app/widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameFIeldController = TextEditingController();
  String? nameErrorText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          textFieldName: 'Name',
          controller: nameFIeldController,
          errorText: nameErrorText,
        ),
        const CustomTextField(
          textFieldName: 'Address',
        ),
        const CustomTextField(
          textFieldName: 'Email',
        ),
        const CustomTextField(
          textFieldName: 'Mobile Number',
        ),
        const CustomTextField(
          textFieldName: 'Password',
        ),
        CustomButton(
          btnText: 'Sign Up',
          onTap: () {
            setState(() {
              nameErrorText = Validation.nameValidator(
                  nameFieldValue: nameFIeldController.text.toString());
            });
          },
        ),
      ],
    );
  }
}
