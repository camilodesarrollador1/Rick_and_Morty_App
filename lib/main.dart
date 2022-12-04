import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_app/providers/providers.dart';

import 'package:rick_morty_app/screens/screens.dart';

void main() {
  runApp(
    AppState(),
  ); // se llama el widget Appstate: (My app se encuentra contenido en el widget AppState)
}

class AppState extends StatelessWidget {
  //Mantendra el estado del personajes_provider

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Inicializar la instancia de personajes_provider

        ChangeNotifierProvider(
            create: (_) => PersonajesProvider(), lazy: false),
        ChangeNotifierProvider(
          create: (_) => EpisodiosProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => UbicacionesProvider(),
          lazy: false,
        )

        //Tan pronto se crea la instancia, se defina la instancia se manda a llamar el constructor--- Lazy: false
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'principal',
      routes: {
        'principal': (_) => Principal_Screen(),
        'episodios': (_) => Episodios_Screen(
              listaEpisodios: EpisodiosProvider().displayEpisodios,
            ),
        'personajes': (_) => Personajes_Screen(
              personajes: PersonajesProvider().displayPersonajes,
            ),
        'ubicacion': (_) => Ubicacion_Screen(
              llamarUbicaciones: UbicacionesProvider().displayUbicaciones,
            ),
      },
    );
  }
}
