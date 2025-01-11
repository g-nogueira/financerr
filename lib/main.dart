import 'package:flutter/material.dart';
import 'package:financerr/screens/home_screen.dart';
import 'package:financerr/services/service_locator.dart';

void main() {
  setupLocator();
  runApp(Financerr());
}

class Financerr extends StatelessWidget {
  const Financerr({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financerr',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}