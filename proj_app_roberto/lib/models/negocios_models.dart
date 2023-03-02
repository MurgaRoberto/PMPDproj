// To parse this JSON data, do
//
//     final negocios = negociosFromJson(jsonString);

import 'dart:convert';

Negocios negociosFromJson(String str) => Negocios.fromJson(json.decode(str));

String negociosToJson(Negocios data) => json.encode(data.toJson());

class Negocios {
    Negocios({
        required this.nombre,
        required this.tipo,
        required this.direccion,
        required this.img,
        required this.descripcion,
        required this.latitud,
        required this.longitud,
    });

    String nombre;
    String tipo;
    String direccion;
    String img;
    String descripcion;
    String latitud;
    String longitud;

    factory Negocios.fromJson(Map<String, dynamic> json) => Negocios(
        nombre: json["nombre"],
        tipo: json["tipo"],
        direccion: json["direccion"],
        img: json["img"],
        descripcion: json["descripcion"],
        latitud: json["latitud"],
        longitud: json["longitud"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "tipo": tipo,
        "direccion": direccion,
        "img": img,
        "descripcion": descripcion,
        "latitud": latitud,
        "longitud": longitud,
    };
}
