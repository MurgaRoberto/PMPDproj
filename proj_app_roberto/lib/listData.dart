import 'package:flutter/material.dart';
import 'package:proj_app_roberto/listview.dart';

class ListDataScreen extends StatefulWidget {
  final String nameJson;
  final String text;

  const ListDataScreen({super.key, required this.nameJson, required this.text});

  @override
  State<ListDataScreen> createState() => _ListDataScreenState();
}

class _ListDataScreenState extends State<ListDataScreen> {
  final List _items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola Mundo'),
      ),
      body: Column(
        children: [
          _items.isNotEmpty?Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {

                // Retorna el Card
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
                                  Text(_items[index]["nombre"],
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                Text(_items[index]["direccion"])
                              ],
                            ),
                          ],
                        ),
                      ),
                      Image(image: AssetImage(_items[index]["img"]),),

                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Text(_items[index]["desc"], textAlign: TextAlign.center,)
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
            ),
          ):Container()
        ],
      ),
    );
  }
}