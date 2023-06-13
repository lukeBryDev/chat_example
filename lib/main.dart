import 'package:chat/src/core/env/env.dart';
import 'package:chat/src/features/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //** Load environment file for project
  await dotenv.load(fileName: "./environments/.env.main");
  //** Load Class for Environment App
  Env(EnvMode.sandbox);
  runApp(const App());
}
