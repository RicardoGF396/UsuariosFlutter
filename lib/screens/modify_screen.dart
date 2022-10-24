import 'package:flutter/material.dart';

import '../models/usuario.dart';

class ModifyScreen extends StatefulWidget {
  final Usuario usuarioModificar;

  const ModifyScreen({Key? key, required this.usuarioModificar})
      : super(key: key);

  @override
  State<ModifyScreen> createState() => _ModifyScreenState();
}

class _ModifyScreenState extends State<ModifyScreen> {
  TextEditingController controllerUsuario = TextEditingController();
  TextEditingController controllerContrasena = TextEditingController();

  String escolaridadNuevo = "";
  String generoNuevo = "";
  List habilidades = [];

  /* Comprobar que habiliddes están puestas para marcar los checkbox */
  bool java = false;
  bool javascript = false;
  bool dart = false;

  String javaS = 'java';
  String javascriptS = 'javascript';
  String dartS = 'dart';

  @override
  void initState() {
    // TODO: implement initState
    Usuario usuario = widget.usuarioModificar;
    controllerUsuario = TextEditingController(text: usuario.nombre);
    controllerContrasena = TextEditingController(text: usuario.contrasena);
    escolaridadNuevo = usuario.escolaridad;
    generoNuevo = usuario.genero;
    habilidades = usuario.habilidades;
    if (habilidades.contains(('java'))) {
      java = true;
    }
    if (habilidades.contains(('javascript'))) {
      javascript = true;
    }
    if (habilidades.contains(('dart'))) {
      dart = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      'Actualizar usuario',
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
                      controller: controllerUsuario,
                      validator: ((value) {
                        if (value == "") {
                          return 'Ingresa el usuario';
                        }
                      }),
                      style: TextStyle(color: Color.fromRGBO(44, 30, 127, 1)),
                      autofocus: false,
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
                      controller: controllerContrasena,
                      validator: ((value) {
                        if (value == "") {
                          return 'Ingresa la contraseña';
                        }
                      }),
                      style: TextStyle(color: Color.fromRGBO(44, 30, 127, 1)),
                      autofocus: false,
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
                      children: const [
                        Text('Escolaridad'),
                      ],
                    ),
                    DropdownButtonFormField(
                      value: escolaridadNuevo,
                      onChanged: (String? newValue) {
                        setState(() {
                          escolaridadNuevo = newValue!;
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
                      children: const [
                        Text('Selecciona el género'),
                      ],
                    ),
                    RadioListTile(
                      value: 'Hombre',
                      groupValue: generoNuevo,
                      onChanged: (value) {
                        setState(() {
                          generoNuevo = value.toString();
                        });
                      },
                      title: Text('Hombre'),
                    ),
                    RadioListTile(
                      value: 'Mujer',
                      groupValue: generoNuevo,
                      onChanged: (value) {
                        setState(() {
                          generoNuevo = value.toString();
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
                    const SizedBox(
                      height: 30,
                    ),
                    /* ElevatedButton(
                        onPressed: (() {
                          print('Usuario: ${controllerUsuario.text}');
                          print('Contraseña: ${controllerContrasena.text}');
                          print('Escolaridad: $escolaridadNuevo');
                          print('Género: $generoNuevo');
                          print('Habilidades técnicas: ' + habilidades[1]);
                        }),
                        child: Text('Verificar valores')), */
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
                              habilidades.add('java');
                            } else {
                              if (habilidades.contains('java')) {
                                habilidades.removeWhere(
                                    (element) => element == 'java');
                              }
                            }

                            if (javascript) {
                              habilidades.add('javascript');
                            } else {
                              if (habilidades.contains('javascript')) {
                                habilidades.removeWhere(
                                    (element) => element == 'javascript');
                              }
                            }

                            if (dart) {
                              habilidades.add('dart');
                            } else {
                              if (habilidades.contains('dart')) {
                                habilidades.removeWhere(
                                    (element) => element == 'dart');
                              }
                            }

                            final nuevoUsuario = Usuario(
                                nombre: controllerUsuario.text,
                                contrasena: controllerContrasena.text,
                                escolaridad: escolaridadNuevo,
                                genero: generoNuevo,
                                habilidades: habilidades);

                            /* Regresamos a la pantalla de inicio */
                            Navigator.pop(context, nuevoUsuario);
                          }),
                          child: Text('Guardar'),
                        )
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
