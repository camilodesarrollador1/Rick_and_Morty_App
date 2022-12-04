import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty_app/busqueda/busquedas.dart';

import 'package:rick_morty_app/models/models.dart';
import 'package:rick_morty_app/providers/providers.dart';

class EpisodiosProvider extends ChangeNotifier {
  String _baseUrl = 'rickandmortyapi.com';

  List<Episodios> displayEpisodios =
      []; //Lista de episodios que va a contener la respuesta obtenida

  EpisodiosProvider() {
    this.getOnEpisodios();
  }

  getOnEpisodios() async {
    var url = Uri.https(_baseUrl, '/api/episode', {'page': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final respuestaEpisodios = EpisodiosResponse.fromJson(response.body);
    // A la lista displayEpisodios se le asigna los valores obtenidos
    displayEpisodios = respuestaEpisodios.results;

    notifyListeners();
  }

  Future<List<Episodios2>> BusquedaDeEpisodios(String query) async {
    var url = Uri.https(_baseUrl, '/api/episode', {'page': '1', 'name': query});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final busquedaa = BusquedaEpisodiosResponse.fromJson(response.body);

    return busquedaa.results;
  }
}
