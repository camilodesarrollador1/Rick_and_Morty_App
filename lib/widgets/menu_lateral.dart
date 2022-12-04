import 'package:flutter/material.dart';
import 'package:rick_morty_app/screens/screens.dart';

class Menu_Lateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          padding:
              EdgeInsets.zero, // Quitar espacio superior entre Drawerheader
          children: [
            DrawerHeader(
              child: Container(
                width: double.infinity,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/rick.jpg'), fit: BoxFit.cover),
              ),
            ),
            // _DrawerHeader(),

            ListTile(
              leading: Icon(Icons.people_outline),
              title: Text('Personajes'),
              subtitle: Text('Characters'),
              iconColor: Colors.blueAccent,
              onTap: () => Navigator.pushNamed(context, 'personajes'),
            ),
            ListTile(
                leading: Icon(Icons.movie_filter_outlined),
                title: Text('Episodios'),
                subtitle: Text('Episodes'),
                iconColor: Colors.blueAccent,
                onTap: () => Navigator.pushNamed(context, ('episodios'))
                // Navigator.pushNamed(context, SettingScreen.routerName), -- Esta bien pero requerimos que el screen al que accdemos también pueda desplegar el menú lateral
                ),
            ListTile(
              leading: Icon(Icons.location_history),
              title: Text('Ubicación'),
              subtitle: Text('Location'),
              iconColor: Colors.blueAccent,
              onTap: () => Navigator.pushNamed(context, 'ubicacion'),
            ),
          ]),
    );
  }
}
