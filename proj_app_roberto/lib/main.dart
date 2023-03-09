import 'package:flutter/material.dart';
import 'package:proj_app_roberto/listData.dart';
import 'package:proj_app_roberto/listview.dart';
import 'package:proj_app_roberto/screens/settingsScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BarraNavegacion(),
        floatingActionButton:  BotonFavoritos(),

        body: MaterialApp(
          home: ListViewScreen(),
        ),
      )
      
    );
  }


  
}




///
/// Widget BottonNavigationBar 
///
class BarraNavegacion extends StatelessWidget {
  const BarraNavegacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon( Icons.search ), label: 'Buscar'),
        BottomNavigationBarItem(icon: Icon( Icons.security ), label: 'Ajustes')
      ],
    );
  }
}





///
/// Boton flotante
///
class BotonFavoritos extends StatelessWidget {
  const BotonFavoritos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.favorite_rounded),
      onPressed: () => const SettingsScreen(),
    );
  }
}