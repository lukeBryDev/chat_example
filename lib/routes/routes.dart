import 'package:chat/src/features/app/presentation/pages/sign_up/pages/sign_up_page.dart';
import 'package:chat/src/features/app/presentation/pages/users/users_page.dart';
import 'package:flutter/material.dart';
import 'package:chat/src/features/app/presentation/pages/chat/pages/chat_page.dart';
import 'package:chat/src/features/app/presentation/pages/home_page.dart';
import 'package:chat/src/features/app/presentation/pages/loading_page.dart';
import 'package:chat/src/features/app/presentation/pages/login_page/pages/login_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  HomePage.routeName: (_) => const HomePage(),
  LoadingPage.routeName: (_) => const LoadingPage(),
  ChatPage.routeName: (_) => const ChatPage(),
  LoginPage.routeName: (_) => const LoginPage(),
  SignUpPage.routeName: (_) => const SignUpPage(),
  UsersPage.routeName: (_) => const UsersPage(),
};
