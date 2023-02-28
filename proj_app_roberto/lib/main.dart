import 'package:flutter/material.dart';
import 'package:proj_app_roberto/listview.dart';
import 'package:proj_app_roberto/screens/select_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectScreen(),
    );
  }
}