import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_app/busqueda/busqueda_personajes.dart';
import 'package:rick_morty_app/models/models.dart';
import 'package:rick_morty_app/providers/personajes_provider.dart';

class Personajes_Screen extends StatefulWidget {
  final List<Personaje> personajes;
  //final Function sigPagina;

  const Personajes_Screen({
    super.key,
    required this.personajes,
  });

  @override
  State<Personajes_Screen> createState() => _Personajes_ScreenState();
}

class _Personajes_ScreenState extends State<Personajes_Screen> {
  final ScrollController scrollcontroller = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollcontroller.addListener(() {
      if (scrollcontroller.position.pixels >=
          scrollcontroller.position.maxScrollExtent - 600) {
        PersonajesProvider().getOnPersonajes();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final obtenerImagenes = Provider.of<PersonajesProvider>(
        context); // Obtener instancia del provider de personajes
    print(obtenerImagenes.displayPersonajes);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text('Detalles Personajes',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: BusquedaPersonajes());
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(top: 15),
          child: ListView.builder(
            controller: scrollcontroller,
            itemCount: obtenerImagenes.displayPersonajes.length,
            itemBuilder: (_, int index) {
              final personajellamar =
                  obtenerImagenes.displayPersonajes[index].image;

              final personajeimagen =
                  obtenerImagenes.displayPersonajes[index].imagenpersonaje;

              final personajename =
                  obtenerImagenes.displayPersonajes[index].name;

              final personajesEpisodios =
                  obtenerImagenes.displayPersonajes[2].episode[index = 0];

              print(personajesEpisodios);

              return Column(children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          //padding: EdgeInsets.only(top: 10),
                          width: 120,
                          height: 100,

                          //color: Colors.green,
                          child: FadeInImage(
                            placeholder: AssetImage('assets/no-image.jpg'),
                            image: NetworkImage(personajeimagen),
                            width: 150,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 20)),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(children: [
                                Text(personajename),
                              ])),
                        ],
                      )
                    ],
                  ),
                ),
                Divider()
              ]);
            },
          ),
        ));
  }
}
