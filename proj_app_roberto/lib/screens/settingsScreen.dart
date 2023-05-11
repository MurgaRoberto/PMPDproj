// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class SettingsScreen extends StatefulWidget {

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  final firebase = FirebaseFirestore.instance;

/// 
/// Utilizamos base de datos no relacional de tipo documental
/// con estructura bson 
/// 
  registroUsuario() async {
    try {
      await FirebaseFirestore.instance.collection('users').doc('registrados').set(
        {
          'name':name.text,
          'password':password.text
        }
      );
    } catch (e) {
      print('ERROR!' + e.toString());
    }
  }

  bool val1 = false;
  int numUsuarios = 0;

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
            controller: name,
            decoration: const InputDecoration(
                hintText: 'Nombre de usuario',
                labelText: 'Nombre de usuario',
                helperText: 'Minimo 3 caracteres',
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
              return value.length < 7 ? 'Minimo 7 valores' : null;
            }),
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: password,
            decoration: const InputDecoration(
                hintText: 'Contraseña',
                labelText: 'Contraseña',
                helperText: 'Minimo 7 caracteres',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10)))),
          
          ),

          const Spacer(flex: 150,),

          // Padding(
          //   padding: EdgeInsets.all(20),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       print('Enviando...');
          //       registroUsuario();  
          //     },
          //     child: Text('Enviar'),
          //   )
          
          // ),

          // btnForm('Registrarse'), 
          btnForm('Iniciar sesión'), 
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
///
/// Boton para registro o inicio de sesión
///
TextButton btnForm(texto) {
  return TextButton(
    style: TextButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 172, 64), fixedSize: Size.fromHeight(50), maximumSize:  const Size.fromWidth(100), ),
    onPressed: () {
      print('ENVIANDO...');
      registroUsuario();
      name.text = '';
      password.text = '';
    },
    child: Text(texto, style: const TextStyle(color: Colors.white),
  )
  );
}
}

