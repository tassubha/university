import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextStyle? style;
  final bool obscureText;
  final TextEditingController controller;

  const MyTextField({
    Key? key,
    required this.hintText,
    this.style,
    required this.obscureText,
    required this.controller,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: style,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: style,
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
          
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}