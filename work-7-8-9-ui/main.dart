import 'package:flutter/material.dart';
import 'package:mobile_odev_2/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(title: 'Homework 7-8-9 / Login Page'),
    );
  }
}
