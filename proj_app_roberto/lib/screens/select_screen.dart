import 'package:flutter/material.dart';
import 'package:proj_app_roberto/providers/puntos_provider.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bares de Pamplona"),),
      body: _lista(),
    );
  }
  
  Widget _lista() {
    return FutureBuilder(
      future: puntosProvider.getListaBares(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(children: _listaElementos(snapshot.data));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  
  List<Widget>  _listaElementos(List? data) {
    final List<Widget> lst = [];
    data?.forEach((p) {
      final w = ListTile(
        title: Text(p.nombre),
        onTap: () {
          print(p.nombre);
        },
      );
    });

    return lst;
  }
}