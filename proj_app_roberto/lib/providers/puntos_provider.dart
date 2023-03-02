import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:proj_app_roberto/models/negocios_models.dart';
import 'package:proj_app_roberto/models/puntos_models.dart';

class PuntosProvider {
  // Lista de negocios sin filtrar
  List<Negocios> _listaNegocios = [];

  // Listas filtradas según tipo
  List<Negocios> _listaBares = [];
  List<Negocios> _listaRestaurantes = [];
  List<Negocios> _listaHoteles = [];

  Future<List<Negocios>> cargarPuntos() async {
    final data = await rootBundle.loadString('data/data.json');
    final decodedData = json.decode(data);
    final openData = decodedData['OpenData'];
    final openDataRow = openData['OpenDataRow'];
    Puntos puntos = Puntos.fromJsonList(openDataRow);
    _listaNegocios = puntos.lista;
    return _listaNegocios;
  }

  Future<List<Negocios>> getListaBares() async {
    if (_listaBares.isEmpty) {
      if(_listaNegocios.isEmpty){
        await cargarPuntos();
      }
      _listaBares = [];
      for (var n in _listaNegocios) {
        if (n.tipo == "bar") {
          _listaBares.add(n);
        }
      }
    }
    return _listaBares;
  }
}
final puntosProvider = PuntosProvider();