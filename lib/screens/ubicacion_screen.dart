import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_app/busqueda/busqueda_ubicacion.dart';
import 'package:rick_morty_app/models/models.dart';
import 'package:rick_morty_app/providers/ubicaciones_provider.dart';
//import 'package:rick_morty_app/busqueda/busquedas.dart';

class Ubicacion_Screen extends StatelessWidget {
  final List<Ubicaciones> llamarUbicaciones;
  const Ubicacion_Screen({super.key, required this.llamarUbicaciones});

  @override
  Widget build(BuildContext context) {
    final buscarProvider = Provider.of<UbicacionesProvider>(context);
    //print(buscarProvider.displayUbicaciones);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text('Detalles Ubicación',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: BusquedaUbicaciones());
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(top: 15),
          child: ListView.builder(
            itemCount: buscarProvider.displayUbicaciones.length,
            itemBuilder: (_, int index) {
              final ubicacionesFinales =
                  buscarProvider.displayUbicaciones[index].name;
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
                          // color: Colors.red,
                          //padding: EdgeInsets.only(top: 10),
                          width: 120,
                          height: 100,
                          //color: Colors.green,
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
                          Text(ubicacionesFinales),
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

// class Tarjeta_Ubicacion extends StatelessWidget {
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
//               // color: Colors.red,
//               //padding: EdgeInsets.only(top: 10),
//               width: 120,
//               height: 100,
//               //color: Colors.green,
//               child: FadeInImage(
//                 placeholder: AssetImage('assets/no-image.jpg'),
//                 image: AssetImage('assets/ubicacion.png'),
//                 width: 120,
//                 height: 100,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Column(
//             children: [
//               Padding(padding: EdgeInsets.only(top: 20)),
//               Text('Nombre de Ubicacióooon'),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
