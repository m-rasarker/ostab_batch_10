import 'package:flu_first_app/pages/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flu_first_app/nav.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
    debugShowCheckedModeBanner: false,
      home: HomeScreen(),

    );
  }
}

