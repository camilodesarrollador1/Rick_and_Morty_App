import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_app/busqueda/busqueda_episodios.dart';

import 'package:rick_morty_app/screens/screens.dart';

class Principal_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text('Rick and Morty App',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: BusquedaEpisodios());
              },
              icon: Icon(Icons.search))
        ],
      ),
      drawer: Menu_Lateral(),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Imagen_Principal(),
            SizedBox(height: 25),
            Texto_Desplazamiento(),
            SizedBox(height: 20),

            // Carrousel_Episodios(),
          ],
        ),
      ),
    );
  }
}

class Texto_Desplazamiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(children: [
        Text(
          'En el menú lateral puede realizar la búsqueda que desea',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
          textAlign: TextAlign.justify,
        ),
        Divider(),
        Text(
          'En esta pantalla Puede buscar los nombres de los episodios',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
          textAlign: TextAlign.justify,
        ),
      ]),
    );
  }
}

class Imagen_Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: FadeInImage(
        placeholder: AssetImage('assets/no-image.jpg'),
        image: AssetImage('assets/bienvenidaa.png'),
      ),
    );
  }
}
