import 'package:flutter/material.dart';
import 'listData.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: const Text('Busca Pamplona'),
      ),
      body: Center(
        child: ListView(
          children: const [
            ListItemWidget(icon: Icon(Icons.sports_bar, color: Color.fromARGB(255, 255, 205, 140)), text: 'Bares', link: ListDataScreen(pageName: 'bares', text: 'Bares')),
            ListItemWidget(icon: Icon(Icons.local_hotel_rounded, color: Color.fromARGB(255, 255, 205, 140)), text: 'Hoteles', link:ListDataScreen(pageName: 'hoteles', text: 'Hoteles')),
            ListItemWidget(icon: Icon(Icons.local_restaurant_rounded, color: Color.fromARGB(255, 255, 205, 140)), text: 'Restaurantes', link:ListDataScreen(pageName: 'restaurantes', text: 'Restaurantes')),
            ListItemWidget(icon: Icon(Icons.storefront_outlined, color: Color.fromARGB(255, 255, 205, 140)), text: 'Supermercados', link:ListDataScreen(pageName: 'supermercados', text: 'Supermercados')),
          ],
        ),
        
      ),
    );
  }
}





  ///
  /// Widget items de la Lista
  ///
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
