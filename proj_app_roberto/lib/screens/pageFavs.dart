import 'package:flutter/material.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Favoritos'),
          ),
        ),
        body: Center(
          child: Text('Hellow World!'),
        ),
    );
  }
}