// ignore: file_names
import 'dart:convert';
import 'dart:core';
import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:like_button/like_button.dart';
import 'package:url_launcher/url_launcher.dart';

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

                                child: comoLlegarBtn(double.parse( _items[index]["latitud"]), double.parse(_items[index]["longitud"]))
                              ),

                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: LikeButton(
                              likeBuilder: (isTapped){
                                return Icon(
                                  Icons.favorite_rounded,
                                  color: isTapped ? Colors.deepPurple : Colors.grey,
                                );
                              },

                            ),
                          )

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


///
/// Abrir google maps
///
Future<void> openMap(double latitude, double longitude) async {
  String mapUrl = '';
  mapUrl = 'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude&travelmode=driving';

  if (await canLaunchUrl(Uri.parse(mapUrl))) {
    await launchUrl(Uri.parse(mapUrl),mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not open the map';
  }
}

///
/// Boton abrir mapa
///
TextButton comoLlegarBtn(double latitude, double longitude){
  return TextButton(
    style: TextButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 172, 64)),
    onPressed: (){
      openMap(latitude, longitude);
    },
    child: const Text('Como llegar', style: TextStyle(color: Colors.white),
  )
  );
}


}