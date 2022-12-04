import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_app/models/models.dart';
import 'package:rick_morty_app/providers/personajes_provider.dart';

class BusquedaPersonajes extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => ' Nombre de Personaje';
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('build Resultados :$query');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(child: Center(child: Text('Esta Vacio')));
    }

    final personajesProvider =
        Provider.of<PersonajesProvider>(context, listen: false);

    return FutureBuilder(
      future: personajesProvider.BusquedaDePersonajes(query),
      builder: (_, AsyncSnapshot<List<Personaje>> snapshot) {
        if (!snapshot.hasData)
          return Container(child: Center(child: Text('Esta Vacio')));

        final DataPersonajes = snapshot.data!;
        return ListView.builder(
          itemCount: DataPersonajes.length,
          itemBuilder: (_, int index) => PersonajesItem(DataPersonajes[index]),
        );
      },
    );
  }
}

class PersonajesItem extends StatelessWidget {
  final Personaje item;
  const PersonajesItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 120,
              height: 100,
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(item.image),
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
                    Text(item.name),
                    Text('Episodio'),
                  ])),
            ],
          )
        ],
      ),
    );
  }
}
