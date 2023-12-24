// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      style: const ButtonStyle(
        minimumSize: MaterialStatePropertyAll(
          Size(310, 41),
        ),
        backgroundColor: MaterialStatePropertyAll(
          Color(0xff2B637B),
        ),
      ),
    );
  }
}
