import 'package:flutter/material.dart';
import 'package:proj_app_roberto/screens/listview.dart';
import 'package:proj_app_roberto/screens/pageFavs.dart';
import 'package:proj_app_roberto/screens/settingsScreen.dart';
import 'package:proj_app_roberto/theme/app_theme.dart';

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
      theme: AppTheme.mainTheme,
      title: 'Material App',
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Color.fromARGB(255, 255, 166, 49),
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
        floatingActionButton: const BotonFavoritos(),
        /// Posicion del boton flotante
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 255, 166, 49),
      onPressed: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FavoritosScreen(),
          )
        );
      }),
      child: const Icon(Icons.favorite_rounded),
    );
  }
}