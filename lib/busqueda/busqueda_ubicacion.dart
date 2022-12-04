import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_app/models/models.dart';
import 'package:rick_morty_app/providers/ubicaciones_provider.dart';

class BusquedaUbicaciones extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar Ubicación';
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

    final ubicacionesProvider =
        Provider.of<UbicacionesProvider>(context, listen: false);

    return FutureBuilder(
      future: ubicacionesProvider.BusquedaDeUbicaciones(query),
      builder: (_, AsyncSnapshot<List<Ubicaciones>> snapshot) {
        if (!snapshot.hasData)
          return Container(child: Center(child: Text('Esta Vacio')));

        final DataUbicaciones = snapshot.data!;
        return ListView.builder(
          itemCount: DataUbicaciones.length,
          itemBuilder: (_, int index) => ubicacionItem(DataUbicaciones[index]),
        );
      },
    );
  }
}

class ubicacionItem extends StatelessWidget {
  final Ubicaciones item;
  const ubicacionItem(this.item);

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
                image: AssetImage('assets/ubicacion.png'),
                width: 120,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(item.name),
            ],
          )
        ],
      ),
    );
  }
}
