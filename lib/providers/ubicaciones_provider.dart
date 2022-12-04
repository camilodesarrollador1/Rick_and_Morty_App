import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class UbicacionesProvider extends ChangeNotifier {
  String _baseUrl = 'rickandmortyapi.com';
  List<Ubicaciones> displayUbicaciones = [];

  UbicacionesProvider() {
    print('Mensaje de Prueba');
    this.getOnUbicaciones();
  }

  getOnUbicaciones() async {
    var url = Uri.https(_baseUrl, '/api/location', {'page': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);

    final llamarUbicacionesMapeado =
        UbicacionesResponse.fromJson(response.body);

    displayUbicaciones = llamarUbicacionesMapeado.results;

    notifyListeners();
  }

  Future<List<Ubicaciones>> BusquedaDeUbicaciones(String query) async {
    var url =
        Uri.https(_baseUrl, '/api/location', {'page': '1', 'name': query});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final busquedaa = UbicacionesResponse.fromJson(response.body);

    return busquedaa.results;
  }
}
