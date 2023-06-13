import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double height;
  final String title;

  const Logo({super.key, this.height = 100, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Image(
              image: const AssetImage('assets/logos/tag-logo.png'),
              height: height),
          const SizedBox(height: 20),
          Text(title, style: const TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
