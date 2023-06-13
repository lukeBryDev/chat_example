import 'package:chat/src/features/app/presentation/pages/login_page/pages/login_page.dart';
import 'package:chat/src/features/app/presentation/pages/sign_up_page/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class AuthLabels extends StatelessWidget {
  /// Case signUpPage
  final bool isSignUp;

  const AuthLabels({Key? key, this.isSignUp = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${isSignUp ? 'Ya' : 'No'} tienes cuenta?',
          style: const TextStyle(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(
                context, isSignUp ? LoginPage.routeName : SignUpPage.routeName);
          },
          child: Text(
            '${isSignUp ? 'Ingresa' : 'Crea una'} ahora!',
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
