import 'package:flutter/material.dart';
import 'package:proj_app_roberto/screens/listview.dart';
import 'package:proj_app_roberto/screens/pageFavs.dart';
import 'package:proj_app_roberto/screens/settingsScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _paginaActual = 0;

  final List<Widget> _paginas = [
    const ListViewScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        /// Barra de navegacion
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              _paginaActual = index;
            });
          },
          currentIndex: _paginaActual,
          items: const [
            BottomNavigationBarItem(icon: Icon( Icons.home ), label: 'Home'),
            BottomNavigationBarItem(icon: Icon( Icons.security ), label: 'Ajustes')
          ],
        ),
        /// Widgety del boton flotante
        floatingActionButton: const BotonFavoritos(),
        /// Posicion del boton flotante
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        
        /// Seteamos la pagina
        body: _paginas[_paginaActual]
        
        ),
        debugShowCheckedModeBanner: false,
    );
  }
}



///
/// Boton flotante
///
class BotonFavoritos extends StatelessWidget {
  const BotonFavoritos({super.key,});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      
      child: const Icon(Icons.favorite_rounded),
      onPressed: (() {
        FavoritosScreen();
        print('Hellow World');
      }),
      // ignore: avoid_print
    );
  }
}