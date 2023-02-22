import 'package:flutter/material.dart';
import 'package:proj_app_roberto/listview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ListViewScreen(),
    );
  }
}