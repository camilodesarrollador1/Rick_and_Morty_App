import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_app/models/models.dart';
import 'package:rick_morty_app/providers/episodios_provider.dart';

class BusquedaEpisodios extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar Episodio';
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

    final episodiosProvider =
        Provider.of<EpisodiosProvider>(context, listen: false);

    return FutureBuilder(
      future: episodiosProvider.BusquedaDeEpisodios(query),
      builder: (_, AsyncSnapshot<List<Episodios2>> snapshot) {
        if (!snapshot.hasData)
          return Container(child: Center(child: Text('Esta Vacio')));

        final Dataa = snapshot.data!;
        return ListView.builder(
          itemCount: Dataa.length,
          itemBuilder: (_, int index) => episodioItem(Dataa[index]),
        );
      },
    );
  }
}

class episodioItem extends StatelessWidget {
  final Episodios2 item;
  const episodioItem(this.item);

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
              width: 100,
              height: 100,
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: AssetImage('assets/prueba.png'),
                width: 120,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  item.name,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
