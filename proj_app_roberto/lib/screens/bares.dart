/*
import 'package:flutter/material.dart';
import 'package:proj_app_roberto/listview.dart';

class BaresScreen extends StatelessWidget {
  const BaresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () { const BaresScreen(); }, child: const Icon(Icons.arrow_circle_down_rounded), ),
      appBar: AppBar(
        title: const Text('Bares'),
      ),
      body: Center(
        child: PageView(
        scrollDirection: Axis.vertical,
        
        children: const [
          GlobalCard(name: 'Txirrintxa', dir: 'C. de la Estafeta, 87, 31001 Pamplona, Navarra', img: 'bares/txirrintxa.jpg', desc: 'Jamones colgados decoran esta clásica taberna con cerveza de elaboración propia más tapas y raciones.',),


          GlobalCard(name: 'Iruñazarra', dir: 'C. Mercaderes, 15, 31001 Pamplona, Navarra', img: 'bares/irunazarra.jpg', desc: 'Tapas, carne y pescado en un restaurante ecléctico con paredes de ladrillo visto y pinchos expuestos en la barra.',),


          GlobalCard(name: 'Chez Belagua', dir: 'C. de la Estafeta, 49, 31001 Pamplona, Navarra', img: 'bares/chezBelagua.jpg', desc: 'Pinchos, menús y helados en una desenfadada tasca con kupelas y una gran lámpara hecha con botellas de sidra.',),


          GlobalCard(name: 'Bar Cervecería la Estafeta', dir: 'C. de la Estafeta, 54, 31001 Pamplona, Navarra', img: 'bares/chezBelagua.jpg', desc: 'Pintxos tradicionales en taberna rústica con vigas vistas y arcos más azulejos con imágenes de Pamplona.',),

          
          GlobalCard(name: 'Bar Fitero Taberna', dir: 'C. de la Estafeta, 58, 31001 Pamplona, Navarra', img: 'bares/chezBelagua.jpg', desc: 'Alta cocina navarra en miniatura y fritos en clásico bar de ambiente taurino y familiar abierto en 1956.',),
        ],

        ),
      )
      
    );
  }
}




class GlobalCard extends StatelessWidget {
  final String name;
  final String dir;
  final String img;
  final String desc;

  const GlobalCard({
    Key? key, required this.name, required this.dir, required this.img, required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      
      
      margin: const EdgeInsets.only(right:5, left: 5, top: 5, bottom: 50),
      color: Colors.white,
      
      
      child: Column(
        children: [
          
          Container(
            padding: const EdgeInsets.only(right: 35, left: 35, top: 10, bottom: 10),
            child: Row(
              children:  [
                Column(
                  
                  children: [
                      Text(name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(dir)
                  ],
                ),
              ],
            ),
          ),
          Image(image: AssetImage(img),),

          Container(
            margin: const EdgeInsets.all(10),
            child: Text(desc, textAlign: TextAlign.center,)
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const ListViewScreen()
                )
              );
            }, 
            child: const Text("Ver en el mapa")
          ),
        ],
      ),
    );
  }
}
*/