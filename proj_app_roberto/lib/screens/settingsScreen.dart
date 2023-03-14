import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj_app_roberto/main.dart';
import 'package:proj_app_roberto/screens/pageFavs.dart';


class SettingsScreen extends StatefulWidget {

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool val1 = false;

  onChangeFunction1(bool newValue1){
    setState(() {
      val1 = newValue1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuraccion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(        
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tema oscuro', style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                  color: Colors.black
                )),
                const Spacer(),
                customSwitch(val1, onChangeFunction1),
                
                ],
              ),
            ],
          )
        ),
      );

  }

  CupertinoSwitch customSwitch(bool val, Function onChangeMethod) {
    return CupertinoSwitch(
                trackColor: Colors.grey.shade700,
                activeColor: Color.fromARGB(255, 255, 205, 140),
                value: val, 
                onChanged: (newValue) { 
                  onChangeMethod(newValue);
                 },
              );
  }
}