import 'package:flutter/material.dart';

import '../main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuraccion'),
      ),
      body: const Center(
        child: Text('Hellow Wolrd!'),

      )
    );
  }
}