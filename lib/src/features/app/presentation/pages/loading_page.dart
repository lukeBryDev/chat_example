import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  static const routeName = 'LoadingPage';

  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [CircularProgressIndicator()],
          ),
        ),
      ),
    );
  }
}
