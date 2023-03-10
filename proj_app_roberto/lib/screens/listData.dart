// ignore: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'listview.dart';

class ListDataScreen extends StatefulWidget {
  final String pageName;
  final String text;
  
  const ListDataScreen({Key? key, required this.pageName, required this.text}) : super(key: key);

  @override
  State<ListDataScreen> createState() => _ListDataScreenState();
}

class _ListDataScreenState extends State<ListDataScreen> {
  List _items = [];
  


  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('data/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data[widget.pageName];
      //print(widget.pageName);
    });
  }
  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.text),
      ),
      body: Column(
          children: [
            // Display the data loaded froim data.json
            _items.isNotEmpty
              ? Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Card(
                      margin: const EdgeInsets.only(right:5, left: 5, top: 5, bottom: 10),
                      color: Colors.white,

                      child: Column(
                        children: [
                          
                          Container(
                            padding: const EdgeInsets.only(right: 35, left: 35, top: 10, bottom: 10),
                            child: Row(
                              children:  [
                                Center(
                                  child: Column(
                                    children: [
                                        Text(_items[index]["nombre"],
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                      ),
                                      Text(_items[index]["direccion"])
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          Image(image: AssetImage(_items[index]["img"]),),

                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Text(_items[index]["descripcion"], textAlign: TextAlign.center,)
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, top: 10, left: 10, bottom: 20),
                              child: ElevatedButton(
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

                          ),
                        ],
                      ),
                    );
                  }
                )
              )
            : Container()
          ],
        ),
    );
  }
}