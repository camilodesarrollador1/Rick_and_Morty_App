import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_app/models/episodios_response.dart';
import 'package:rick_morty_app/providers/episodios_provider.dart';
import 'package:rick_morty_app/models/models.dart';

class Episodios_Screen extends StatelessWidget {
  final List<Episodios> listaEpisodios;

  const Episodios_Screen({super.key, required this.listaEpisodios});
  @override
  Widget build(BuildContext context) {
    final buscarProvider = Provider.of<EpisodiosProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Detalles de Episodios'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 15),
          child: ListView.builder(
            itemCount: buscarProvider.displayEpisodios.length,
            itemBuilder: (_, int index) {
              final capitulo = buscarProvider.displayEpisodios[index].name;
              final numero_Episodio = buscarProvider.displayEpisodios[index].id;
              final codigo_Episodio =
                  buscarProvider.displayEpisodios[index].episode;
              //print(capitulo);
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
                          width: 100,
                          height: 100,
                          //color: Colors.red,

                          //color: Colors.green,
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
                              '$capitulo',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 16),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text('E: ${numero_Episodio}'),
                          Text('Cod: ${codigo_Episodio}')
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

// class Tarjeta_Episodios extends StatelessWidget {
//   final List<Episodios> listaEpisodios;

//   const Tarjeta_Episodios({super.key, required this.listaEpisodios});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 15),
//       width: double.infinity,
//       height: 100,
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Container(
//               //padding: EdgeInsets.only(top: 10),
//               width: 120,
//               height: 100,

//               //color: Colors.green,
//               child: FadeInImage(
//                 placeholder: AssetImage('assets/no-image.jpg'),
//                 image: AssetImage('assets/prueba.png'),
//                 width: 150,
//                 height: 100,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Column(
//             children: [
//               Padding(padding: EdgeInsets.only(top: 20)),
//               Text('titulo'),
//               Text('Episodio'),
//               Text('Codigo de episodio')
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
