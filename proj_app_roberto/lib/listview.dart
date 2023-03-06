import 'package:flutter/material.dart';
import 'package:proj_app_roberto/listData.dart';
import 'package:proj_app_roberto/screens/bares.dart';
import 'package:proj_app_roberto/screens/hoteles.dart';
import 'package:proj_app_roberto/screens/restaurantes.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('¿Qué necesitas?'),
      ),
      body: Center(
        child: ListView(
          children: const [
            ListItemWidget(icon: Icon(Icons.sports_bar), text: 'Bares', link: ListDataScreen(nameJson: "bares", text: 'Bares',)),
            ListItemWidget(icon: Icon(Icons.local_hotel_rounded), text: 'Hoteles', link: HotelesScreen()),
            ListItemWidget(icon: Icon(Icons.local_restaurant_rounded), text: 'Restaurantes', link: RestaurantesScreen()),
          ],
        ),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final Icon icon;
  final String text;
  final Widget link;

  const ListItemWidget({
    Key? key, required this.text, required this.icon, required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),

      child: ListTile(
        leading: icon,
        title: Text(text),
        trailing: const Icon(Icons.navigate_next),
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => link
            ),
          );
        },
      ),
    );
  }
}