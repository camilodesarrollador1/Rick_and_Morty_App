// To parse this JSON data, do
//
//     final episodiosResponse = episodiosResponseFromMap(jsonString);

import 'dart:convert';

class EpisodiosResponse {
  EpisodiosResponse({
    // required this.info,
    required this.results,
  });

  //Info info;
  List<Episodios> results;

  factory EpisodiosResponse.fromJson(String str) =>
      EpisodiosResponse.fromMap(json.decode(str));

  factory EpisodiosResponse.fromMap(Map<String, dynamic> json) =>
      EpisodiosResponse(
        //info: Info.fromMap(json["info"]),
        results: List<Episodios>.from(
            json["results"].map((x) => Episodios.fromMap(x))),
      );
}

class Episodios {
  Episodios({
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

  factory Episodios.fromJson(String str) => Episodios.fromMap(json.decode(str));

  factory Episodios.fromMap(Map<String, dynamic> json) => Episodios(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );
}
