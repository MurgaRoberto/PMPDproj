import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:proj_app_roberto/models/negocios_models.dart';
import 'package:proj_app_roberto/models/puntos_models.dart';

class PuntosProvider {
  List<Negocios> _listaNegocios = [];

  List<Negocios> _listaBares = [];
  List<Negocios> _listaHoteles = [];
  List<Negocios> _listaRestaurantes = [];
  

  Future<List<Negocios>> cargarPuntos() async {
    final data = await rootBundle
        .loadString('assets/data/data.json');
    final decodedData = json.decode(data);
    final openData = decodedData['OpenData'];
    final openDataRow = openData['OpenDataRow'];
    Puntos puntos = Puntos.fromJsonList(openDataRow);
    _listaNegocios = puntos.lista;
    return _listaNegocios;
  }

  Future<List<Negocios>> getListaBares() async {
    if (_listaBares.isEmpty) {
      if (_listaNegocios.isEmpty) {
        await cargarPuntos();
      }
      _listaBares = [];

      _listaNegocios.forEach((n) {
        if (n.tipo == "bar") {
          _listaBares.add(n);
        }
      });
    }
    return _listaBares;
  }
  Future<List<Negocios>> getListaHoteles() async {
    if (_listaHoteles.isEmpty) {
      if (_listaNegocios.isEmpty) {
        await cargarPuntos();
      }
      _listaHoteles = [];

      _listaNegocios.forEach((n) {
        if (n.tipo == "hotel") {
          _listaHoteles.add(n);
        }
      });
    }
    return _listaHoteles;
  }
  Future<List<Negocios>> getListRestaurantes() async {
    if (_listaRestaurantes.isEmpty) {
      if (_listaNegocios.isEmpty) {
        await cargarPuntos();
      }
      _listaRestaurantes = [];

      _listaNegocios.forEach((n) {
        if (n.tipo == "restaurante") {
          _listaRestaurantes.add(n);
        }
      });
    }
    return _listaRestaurantes;
  }
}

final puntosProvider = new PuntosProvider();