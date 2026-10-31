import 'package:flutter/material.dart';

void main() {
  runApp(const homeScreen());
}

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("HomeScreen")));
  }
}
