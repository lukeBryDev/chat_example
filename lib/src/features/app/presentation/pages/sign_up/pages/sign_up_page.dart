import 'dart:developer';

import 'package:chat/src/features/app/presentation/widgets/auth_labels.dart';
import 'package:chat/src/features/app/presentation/widgets/custom_button.dart';
import 'package:chat/src/features/app/presentation/widgets/custom_input.dart';
import 'package:chat/src/features/app/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignUpPage extends StatelessWidget {
  static const routeName = '/SignUpPage';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Logo(title: 'Sign-up'),
                  _Form(
                    onEmailChanged: (v) {
                      email = v;
                    },
                    onPasswordChanged: (v) {
                      password = v;
                    },
                    onPressed: () {
                      log('$email', name: 'email');
                      log('$password', name: 'password');
                    },
                  ),
                  const AuthLabels(isSignUp: true),
                  const Text(
                    'Términos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  final void Function()? onPressed;
  final void Function(String)? onUserChanged;
  final void Function(String)? onEmailChanged;
  final void Function(String)? onPasswordChanged;

  const _Form(
      {Key? key,
      this.onPressed,
      this.onUserChanged,
      this.onEmailChanged,
      this.onPasswordChanged})
      : super(key: key);

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomInput(
          onChanged: widget.onUserChanged,
          prefixIcon: const Icon(Icons.person),
          hintText: 'User',
        ),
        const SizedBox(height: 10),
        CustomInput(
          onChanged: widget.onEmailChanged,
          prefixIcon: const Icon(Icons.mail_outline),
          keyboardType: TextInputType.emailAddress,
          hintText: 'Email',
        ),
        const SizedBox(height: 10),
        CustomInput(
          onChanged: widget.onPasswordChanged,
          prefixIcon: const Icon(Icons.password_outlined),
          obscureText: obscurePassword,
          suffixIcon: IconButton(
            icon: Icon(obscurePassword ? MdiIcons.eye : MdiIcons.eyeOff),
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          ),
          hintText: 'Password',
        ),
        const SizedBox(height: 20),
        CustomButton(
          onPressed: widget.onPressed,
          text: 'Registrarse',
        )
      ],
    );
  }
}
