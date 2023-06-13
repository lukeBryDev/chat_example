import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final void Function(String)? onChanged;

  const CustomInput({
    super.key,
    this.keyboardType,
    this.prefixIcon,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 5, top: 5, left: 5, right: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          autocorrect: false,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              hintText: hintText),
        ));
  }
}
