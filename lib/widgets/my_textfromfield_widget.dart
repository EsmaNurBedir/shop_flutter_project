import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextFromField extends StatelessWidget {
  final String hintText;
  bool obscureText = false;


  MyTextFromField({
    Key key,
    this.hintText,
    this.obscureText, 
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
            fillColor: Colors.grey[100],
            filled: true,
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }
}
