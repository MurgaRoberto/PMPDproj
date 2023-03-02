import 'package:flutter/material.dart';
import 'package:proj_app_roberto/providers/puntos_provider.dart';

import '../models/negocios_models.dart';
import '../widgets/swiper_widget.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bares de Pamplona"),),
      body: _swiper(),
    );
  }
  
  Widget _swiper() {
    return FutureBuilder(
      future: puntosProvider.getListaBares(),
      initialData: const [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SwiperWidget(lista: snapshot.data);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  
  List<Widget> _listaElementos(List<Negocios> data) {
    final List<Widget> lst = [];
    data?.forEach((p) {
      final w = ListTile(
        title: Text(p.nombre),
        onTap: () {
          // ignore: avoid_print
          print(p.nombre);
        },
      );
      lst.add(w);
      lst.add(const Divider());
    });

    return lst;
  }
}