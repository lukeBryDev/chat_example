import 'package:chat/routes/routes.dart';
import 'package:chat/src/features/app/presentation/pages/chat_page.dart';
import 'package:chat/src/features/app/presentation/pages/loading_page.dart';
import 'package:chat/src/features/app/presentation/pages/login_page/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute: LoginPage.routeName,
      routes: appRoutes,
    );
  }
}
