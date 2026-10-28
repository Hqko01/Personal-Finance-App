import 'package:flutter/material.dart';
import 'package:personal_finance/screens/login.dart';

void main() {
  runApp(const mainApp());
}

class mainApp extends StatefulWidget {
  const mainApp({super.key});

  @override
  State<mainApp> createState() => _mainAppState();
}

class _mainAppState extends State<mainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
