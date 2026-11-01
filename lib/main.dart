import 'package:flutter/material.dart';
import 'package:personal_finance/core/routes/appRoutes.dart';
import 'package:personal_finance/screens/login.dart';

const mainColor = Color.fromARGB(255, 255, 240, 255);
const mainColorShadow = Color.fromARGB(255, 209, 209, 209);
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
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
