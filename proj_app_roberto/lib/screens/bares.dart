import 'package:flutter/material.dart';

class BaresScreen extends StatelessWidget {
  const BaresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bares'),
      ),
      body: Container(
        child: Card(
          
        
          margin: const EdgeInsets.all(5),
          color: Colors.white,
          
          child: Column(
            children: [
              
              Container(
                margin: const EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
                child: Row(
                  children:  [
                    Column(
                      
                      children:  [
                         const Text('Lugares de práctica',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text('lugar')
                      ],
                    ),
                    Expanded(child: Container()),
                    Column(
                      children:  [
                         const Text('Preparacción',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text('preparacion')
                      ],
                    ),
                    Expanded(child: Container()),



                    Column(
                      children: [
                        Row(
                          children: const [
                             Text('Peligrosidad',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Icon(Icons.warning),
                          ],
                        ),
                        Row(
                          children: [ 
                            Text('peligrosidad'),
                            
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /*Image(image: AssetImage(img),),*/

              Container(
                margin: const EdgeInsets.all(10),
                child: Text('desc', textAlign: TextAlign.center,)
              )
            ],
          ),
        ),
      ),
    );
  }
}