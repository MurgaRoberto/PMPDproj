import 'package:flutter/material.dart';
import 'bares.dart';

class RestaurantesScreen extends StatelessWidget {
  const RestaurantesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoteles'),
      ),
      body: const GlobalCard(name: 'La Mar Salada', dir: 'C. de Leyre, 12, 31002 Pamplona, Navarra', img: 'restaurantes/laMarSalada.jpg', desc: 'Originales platos de pescado, marisco, carne y arroz en un moderno restaurante en tonos de madera clara.',),
    );
  }
}
