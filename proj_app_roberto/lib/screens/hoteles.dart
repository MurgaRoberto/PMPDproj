import 'package:flutter/material.dart';
import 'bares.dart';

class HotelesScreen extends StatelessWidget {
  const HotelesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoteles'),
      ),
      body: const GlobalCard(name: 'Hotel la Perla', dir: 'Plaza del castillo, nº1, Pamplona, Navarra', img: 'hoteles/laPerla.jpg', desc: 'Este hotel refinado, ubicado en un edificio elegante del siglo XIX en la esquina de la plaza del Castillo, se encuentra a 4 minutos a pie de la catedral de Pamplona y a 2 km de la estación de trenes de Pamplona.',),
    );
  }
}

