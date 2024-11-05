import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final GestureTapCallback? onTap;
  const CustomButton({
    super.key,
    required this.btnText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black,
          ),
          child: Text(
            btnText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
