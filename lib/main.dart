import 'package:flutter/material.dart';
import 'package:flutter_application_4/home_page.dart';
import 'package:flutter_application_4/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Deo',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const MyHomePage());
}

   