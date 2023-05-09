import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
        title: const Text('Perfil'),
      ),
      
        body: Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {},
            validator: ((value) {
              if (value == null) return 'campo vacío y es obligatorio';
              return value.length < 3 ? 'Minimo 3 valores' : null;
            }),
            keyboardType: TextInputType.name,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
                hintText: 'Nombre de usuario',
                labelText: 'Nombre de usuario',
                counterText: '3 carácteres mínimo',
                prefixIcon: Icon(Icons.person_outline_rounded),
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10)))),
          ),

          const Spacer(flex: 10,),

          TextFormField(
            onChanged: (value) {},
            validator: ((value) {
              if (value == null) return 'campo vacío y es obligatorio';
              return value.length < 3 ? 'Minimo 3 valores' : null;
            }),
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
                hintText: 'E-Mail',
                labelText: 'Email',
                helperText: 'Solo letras',
                counterText: 'example@email.com',
                prefixIcon: Icon(Icons.alternate_email_rounded),
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10)))),
          
          ),

          const Spacer(flex: 150,),
          comoLlegarBtn(),
          //const CheckBoxScreen(),
        ],
      ),
    ));
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


///
/// Boton abrir mapa
///
TextButton comoLlegarBtn(){
  return TextButton(
    style: TextButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 172, 64), fixedSize: Size.fromHeight(50), maximumSize:  const Size.fromWidth(100), ),
    onPressed: (){
      print('Hello');
    },
    child: const Text('Entrar', style: TextStyle(color: Colors.white),
  )
  );
}