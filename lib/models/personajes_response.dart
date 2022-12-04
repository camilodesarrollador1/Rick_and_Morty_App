// To parse this JSON data, do
//
//     final episodiosResponse = episodiosResponseFromMap(jsonString);

// To parse this JSON data, do
//
//     final episodiosResponse = episodiosResponseFromMap(jsonString);

import 'dart:convert';

class PersonajesResponse {
  PersonajesResponse({
    required this.info,
    required this.results,
  });

  Info info;
  List<Personaje> results;

  factory PersonajesResponse.fromJson(String str) =>
      PersonajesResponse.fromMap(json.decode(str));

  factory PersonajesResponse.fromMap(Map<String, dynamic> json) =>
      PersonajesResponse(
        info: Info.fromMap(json["info"]),
        results: List<Personaje>.from(
            json["results"].map((x) => Personaje.fromMap(x))),
      );
}

class Info {
  Info({
    required this.count,
    required this.pages,
    this.next,
    required this.prev,
  });

  int count;
  int pages;
  String? next;
  dynamic prev;

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        //next: json["next"],
        prev: json["prev"],
      );
}

class Personaje {
  Personaje({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    this.origin,
    this.location,
    required this.image,
    required this.episode,
    required this.url,
    this.created,
  });

  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  String? origin;
  String? location;
  String image;
  List<String> episode;
  String url;
  String? created;

  get imagenpersonaje {
    if (this.image != null) return '${this.image}';
    return 'https://www.giulianisgrupo.com/wp-content/uploads/2018/05/nodisponible.png';
  }

  get namepersonaje {
    if (this.name != null) return '${this.name}';
  }

  factory Personaje.fromJson(String str) => Personaje.fromMap(json.decode(str));

  factory Personaje.fromMap(Map<String, dynamic> json) => Personaje(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        //origin: json["origin"],
        //location: json["location"],
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: json["created"],
      );
}
