import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:usuarios/models/usuario.dart';
import 'package:usuarios/screens/login.dart';

import '../main.dart';

class DetailScreen extends StatefulWidget {
  final List<Usuario> listaUsuarios;

  /* Lista que va a recibir esta pantalla */
  const DetailScreen({Key? key, required this.listaUsuarios}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String usuario = "";
  String contrasena = "";
  String genero = "";

  bool java = false;
  bool javascript = false;
  bool dart = false;

  String javaS = 'java';
  String javascriptS = 'javascript';
  String dartS = 'dart';

  final listaHabilidades = [];

  String escolaridad = 'Primaria';

  /* ===== Lista de Usuarios ===== */
  List<Usuario> nuevaListaUsuarios = [];

  @override
  Widget build(BuildContext context) {
    //no radio button will be selected on initial

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30, left: 25, right: 25),
          margin: EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'Formulario de usuario',
                    style: TextStyle(
                        color: Color.fromRGBO(44, 30, 127, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  TextFormField(
                    onChanged: ((value) {
                      setState(() {
                        usuario = value.toString();
                      });
                    }),
                    validator: ((value) {
                      if (value == "") {
                        return 'Ingresa el usuario';
                      }
                    }),
                    style: TextStyle(color: Color.fromRGBO(44, 30, 127, 1)),
                    autofocus: false,
                    initialValue: '',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(44, 30, 127, 1)),
                      labelText: 'Usuario',
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(44, 30, 127, 1)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(44, 30, 127, 1)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: ((value) {
                      setState(() {
                        contrasena = value.toString();
                      });
                    }),
                    validator: ((value) {
                      if (value == "") {
                        return 'Ingresa la contraseña';
                      }
                    }),
                    style: TextStyle(color: Color.fromRGBO(44, 30, 127, 1)),
                    autofocus: false,
                    initialValue: '',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(44, 30, 127, 1)),
                      labelText: 'Contraseña',
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(44, 30, 127, 1)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(44, 30, 127, 1)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('Escolaridad'),
                    ],
                  ),
                  DropdownButtonFormField(
                    value: escolaridad,
                    onChanged: (String? newValue) {
                      setState(() {
                        escolaridad = newValue!;
                      });
                    },
                    items: <String>[
                      'Primaria',
                      'Secundaria',
                      'Preparatoria',
                      'Licenciatura'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('Selecciona el género'),
                    ],
                  ),
                  RadioListTile(
                    value: 'Hombre',
                    groupValue: genero,
                    onChanged: (value) {
                      setState(() {
                        genero = value.toString();
                        //print('Hombre');
                        print(genero);
                      });
                    },
                    title: Text('Hombre'),
                  ),
                  RadioListTile(
                    value: 'Mujer',
                    groupValue: genero,
                    onChanged: (value) {
                      setState(() {
                        genero = value.toString();
                        //print('Mujer');
                        print(genero);
                      });
                    },
                    title: Text('Mujer'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('Habilidades técnicas'),
                    ],
                  ),
                  CheckboxListTile(
                      title: const Text('Java'),
                      value: java,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: ((value) {
                        setState(() {
                          java = value!;
                        });
                      })),
                  CheckboxListTile(
                      title: const Text('Javascript'),
                      value: javascript,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: ((value) {
                        setState(() {
                          javascript = value!;
                          
                        });
                      })),
                  CheckboxListTile(
                      title: const Text('Dart'),
                      value: dart,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: ((value) {
                        setState(() {
                          dart = value!;
                        });
                      })),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(76, 52, 224, 1),
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 50)),
                        onPressed: (() {
                          Navigator.pop(context);
                        }),
                        child: Text('Regresar'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(76, 52, 224, 1),
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 50)),
                        onPressed: (() {
                          /* Revisar que habilidades fueron activadas */
                          if (java) {
                            listaHabilidades.add((javaS));
                          }
                          if (javascript) {
                            listaHabilidades.add((javascriptS));
                          }
                          if (dart) {
                            listaHabilidades.add((dartS));
                          }

                          nuevaListaUsuarios = widget.listaUsuarios;

                          nuevaListaUsuarios.add(Usuario(
                              nombre: usuario,
                              contrasena: contrasena,
                              escolaridad: escolaridad,
                              genero: genero,
                              habilidades: listaHabilidades));

                          /* Regresamos a la pantalla de inicio */
                          Navigator.pop(
                            context, nuevaListaUsuarios
                          );
                        }),
                        child: Text('Guardar'),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
