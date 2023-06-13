import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  final String? text;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.child,
    this.text,
    this.textStyle = const TextStyle(fontSize: 17, color: Colors.white),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        elevation: 2,
        shape: const StadiumBorder(),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 55,
        width: double.infinity,
        child: child ??
            Text(
              text ?? '',
              style: textStyle,
            ),
      ),
    );
  }
}
