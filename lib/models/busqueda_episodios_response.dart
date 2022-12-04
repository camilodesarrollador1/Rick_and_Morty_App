// To parse this JSON data, do
//
//     final busquedaEpisodiosResponse = busquedaEpisodiosResponseFromMap(jsonString);

import 'dart:convert';

class BusquedaEpisodiosResponse {
  BusquedaEpisodiosResponse({
    // @required this.info,
    required this.results,
  });

  //Info info;
  List<Episodios2> results;

  factory BusquedaEpisodiosResponse.fromJson(String str) =>
      BusquedaEpisodiosResponse.fromMap(json.decode(str));

  factory BusquedaEpisodiosResponse.fromMap(Map<String, dynamic> json) =>
      BusquedaEpisodiosResponse(
        //info: Info.fromMap(json["info"]),
        results: List<Episodios2>.from(
            json["results"].map((x) => Episodios2.fromMap(x))),
      );
}

// class Info {
//     Info({
//         @required this.count,
//         @required this.pages,
//         @required this.next,
//         @required this.prev,
//     });

//     int count;
//     int pages;
//     String next;
//     dynamic prev;

//     factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Info.fromMap(Map<String, dynamic> json) => Info(
//         count: json["count"],
//         pages: json["pages"],
//         next: json["next"],
//         prev: json["prev"],
//     );

//     Map<String, dynamic> toMap() => {
//         "count": count,
//         "pages": pages,
//         "next": next,
//         "prev": prev,
//     };
// }

class Episodios2 {
  Episodios2({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  int id;
  String name;
  String airDate;
  String episode;
  List<String> characters;
  String url;
  DateTime created;

  factory Episodios2.fromJson(String str) =>
      Episodios2.fromMap(json.decode(str));

  factory Episodios2.fromMap(Map<String, dynamic> json) => Episodios2(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );
}
