import 'package:flutter/material.dart';
import 'package:usuarios/screens/user_detail.dart';
import 'package:usuarios/screens/user_list.dart';

import '../main.dart';
import '../models/usuario.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String nombre = "";
  String contrasena = "";

  List<Usuario> listaUsuarios = [
    Usuario(
      nombre: 'Ricardo',
      contrasena: '12345',
      escolaridad: 'Licenciatura',
      genero: 'Hombre',
      habilidades: ['javascript'],
    ),
    Usuario(
      nombre: 'Lila',
      contrasena: '12345',
      escolaridad: 'Licenciatura',
      genero: 'Mujer',
      habilidades: ['java'],
    ),
    Usuario(
      nombre: 'Pepe',
      contrasena: '12345',
      escolaridad: 'Licenciatura',
      genero: 'Hombre',
      habilidades: ['dart'],
    ),
    Usuario(
      nombre: 'Sanjuana',
      contrasena: '12345',
      escolaridad: 'Licenciatura',
      genero: 'Mujer',
      habilidades: ['javascript'],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 120),
            child: Column(
              children: [
                const Image(image: AssetImage('assets/logoF.png')),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Iniciar sesión',
                  style: TextStyle(
                      color: Color.fromRGBO(44, 30, 127, 1),
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Organiza a tus clientes, en un solo segundos',
                  style: TextStyle(color: Color.fromRGBO(123, 123, 123, .73)),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            nombre = value.toString();
                          });
                        },
                        style: TextStyle(color: Color.fromRGBO(44, 30, 127, 1)),
                        autofocus: false,
                        initialValue: '',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          labelStyle:
                              TextStyle(color: Color.fromRGBO(44, 30, 127, 1)),
                          labelText: 'Usuario',
                          prefixIcon: Icon(Icons.supervised_user_circle,
                              color: Color.fromRGBO(44, 30, 127, 1)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(44, 30, 127, 1)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(44, 30, 127, 1)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            contrasena = value.toString();
                          });
                        },
                        style: TextStyle(color: Color.fromRGBO(44, 30, 127, 1)),
                        autofocus: false,
                        obscureText: true,
                        initialValue: '',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          labelStyle:
                              TextStyle(color: Color.fromRGBO(44, 30, 127, 1)),
                          labelText: 'Contraseña',
                          prefixIcon: Icon(Icons.password_sharp,
                              color: Color.fromRGBO(44, 30, 127, 1)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(44, 30, 127, 1)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(44, 30, 127, 1)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            '¿No tienes cuenta?',
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          GestureDetector(
                            child: const Text('Registrate',
                                style: TextStyle(
                                    color: Color.fromRGBO(44, 30, 127, 1),
                                    fontWeight: FontWeight.bold)),
                            onTap: () async {
                              final listaActualizada = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                            listaUsuarios: listaUsuarios,
                                          )));
                              setState(() {
                                listaUsuarios = listaActualizada;
                                showDialog(
                                    context: context,
                                    builder: (_) => const AlertDialog(
                                          title: Text('Registro'),
                                          content: Text(
                                              'El usuario fue añadido con éxito'),
                                        ));
                              });
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(76, 52, 224, 1),
                              onPrimary: Colors.white,
                              elevation: 3,
                              minimumSize: Size(double.infinity, 50)),
                          onPressed: () {
                            /* Verificar que no están los campos vacíos */
                            if (nombre.isEmpty || contrasena.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (_) => const AlertDialog(
                                        title: Text('Hubo un problema'),
                                        content: Text(
                                            'Uno o más campos estan vacíos, completalos.'),
                                      ));
                            } else {
                              /* Generar objeto a partir del usuario */
                              final usuarioVerificar = listaUsuarios
                                  .where((element) => element.nombre == nombre)
                                  .toList();
                              if (usuarioVerificar.length == 0) {
                                showDialog(
                                    context: context,
                                    builder: (_) => const AlertDialog(
                                          title: Text('Hubo un problema'),
                                          content: Text('El usuario no existe'),
                                        ));
                              } else {
                                /* ===== SI EXISTE ====== */
                                /* Verificar si la contraseña es correcta */
                                if (usuarioVerificar[0].contrasena ==
                                    contrasena) {
                                  print('Las contraseñas sí son iguales');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ListaScreen(
                                                listaUsuarios: listaUsuarios,
                                              )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (_) => const AlertDialog(
                                            title: Text('Hubo un problema'),
                                            content:
                                                Text('Contraseña incorrecta'),
                                          ));
                                }
                              }
                            }
                          },
                          child: const Text(
                            'Iniciar sesión',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ))
                    ],
                  ),
                ),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 150),
                    child: Image(
                      image: AssetImage('assets/decorationF.png'),
                      fit: BoxFit.cover,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
