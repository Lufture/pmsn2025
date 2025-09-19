import 'package:flutter/material.dart';
import 'package:pmsn2025/screens/home_screen.dart';
import 'package:pmsn2025/screens/register_screen.dart';
import 'screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      routes: {
        "/home":(context) => HomeScreen(),
        "/login":(context) => LoginScreen(),
        "/register":(context) => RegisterScreen(),
      },
      title: 'Material App', home: LoginScreen()
      );
  }
}