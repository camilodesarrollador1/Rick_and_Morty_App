// To parse this JSON data, do
//
//     final ubicacionesResponse = ubicacionesResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UbicacionesResponse {
  UbicacionesResponse({
    // @required this.info,
    required this.results,
  });

  // Info info;
  List<Ubicaciones> results;

  factory UbicacionesResponse.fromJson(String str) =>
      UbicacionesResponse.fromMap(json.decode(str));

  factory UbicacionesResponse.fromMap(Map<String, dynamic> json) =>
      UbicacionesResponse(
        // info: Info.fromMap(json["info"]),
        results: List<Ubicaciones>.from(
            json["results"].map((x) => Ubicaciones.fromMap(x))),
      );
}

class Ubicaciones {
  Ubicaciones({
    required this.id,
    required this.name,
    this.type,
    this.dimension,
    this.residents,
    required this.url,
    required this.created,
  });

  int id;
  String name;
  String? type;
  String? dimension;
  List<String>? residents;
  String url;
  DateTime created;

  factory Ubicaciones.fromJson(String str) =>
      Ubicaciones.fromMap(json.decode(str));

  factory Ubicaciones.fromMap(Map<String, dynamic> json) => Ubicaciones(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: json["dimension"],
        //  residents: List<String>.from(json["residents"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );
}
