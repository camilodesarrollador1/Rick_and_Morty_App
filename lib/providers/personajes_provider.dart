import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty_app/models/models.dart';

class PersonajesProvider extends ChangeNotifier {
  String _baseUrl = 'rickandmortyapi.com';

  int _paginas = 0;

  List<Personaje> displayPersonajes = []; // Listado de Personaje
  List<Info> llamarpaginapersonajes = [];

  PersonajesProvider() {
    // print('inicializado');

    this.getOnPersonajes();
  }

  Future<String> getobtenerPagina([int page = 1]) async {
    var url = Uri.https(_baseUrl, '/api/character', {'page': '$page'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    return response.body;
  }

  getOnPersonajes() async {
    _paginas++;
    final jsonData = await this.getobtenerPagina(_paginas);

    final infoPersonaje = PersonajesResponse.fromJson(jsonData);

    //print(infoPersonaje.info[0].);

    //displayPersonajes = infoPersonaje.results;

    displayPersonajes = [...displayPersonajes, ...infoPersonaje.results];

    notifyListeners();
  }

  Future<List<Personaje>> BusquedaDePersonajes(String query) async {
    var url =
        Uri.https(_baseUrl, '/api/character', {'page': '1', 'name': query});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final busquedaa = PersonajesResponse.fromJson(response.body);

    return busquedaa.results;
  }
}
