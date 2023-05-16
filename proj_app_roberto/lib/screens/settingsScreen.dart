import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SettingsScreen extends StatefulWidget {

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();


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

          btnForm('Iniciar sesión'), 
          
        ],
      ),
    ));
  }
///
///
/// BORRAR 
///
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
ElevatedButton btnForm(texto) {
  return ElevatedButton(
    style: TextButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 172, 64), fixedSize: Size.fromHeight(50), maximumSize:  const Size.fromWidth(100), ),
    onPressed: () {
      print('ENVIANDO...');
      name.text = '';
      password.text = '';

    },
    child: Text(texto, style: const TextStyle(color: Colors.white),
  )
  );
}
}

