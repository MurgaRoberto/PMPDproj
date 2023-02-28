// To parse this JSON data, do
//
//     final bares = baresFromJson(jsonString);

import 'dart:convert';

Negocios baresFromJson(String str) => Negocios.fromJson(json.decode(str));

String baresToJson(Negocios data) => json.encode(data.toJson());

class Negocios {
    Negocios({
        required this.nombre,
        required this.tipo,
        required this.direccion,
        required this.descripcion,
        required this.img,
        required this.latitud,
        required this.longitud,
    });

    String nombre;
    String tipo;
    String direccion;
    String descripcion;
    String img;
    String latitud;
    String longitud;

    factory Negocios.fromJson(Map<String, dynamic> json) => Negocios(
        nombre: json["nombre"],
        tipo: json["tipo"],
        direccion: json["direccion"],
        descripcion: json["descripcion"],
        img: json["img"],
        latitud: json["latitud"],
        longitud: json["longitud"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "tipo": tipo,
        "direccion": direccion,
        "descripcion": descripcion,
        "img": img,
        "latitud": latitud,
        "longitud": longitud,
    };
}
