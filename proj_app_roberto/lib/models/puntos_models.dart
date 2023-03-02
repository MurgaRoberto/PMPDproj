import 'package:proj_app_roberto/models/negocios_models.dart';

class Puntos {
  List<Negocios> lista = List.empty();
  Puntos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((json) {
      final pr = Negocios.fromJson(json);
      lista.add(pr);
    });
  }
}