import 'package:flutter/material.dart';
import 'package:usuarios/main.dart';
import 'package:usuarios/screens/modify_screen.dart';

import '../models/usuario.dart';

class ListaScreen extends StatefulWidget {
  final List<Usuario> listaUsuarios;

  ListaScreen({Key? key, required this.listaUsuarios}) : super(key: key);

  @override
  State<ListaScreen> createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {
  @override
  Widget build(BuildContext context) {
    /* ===== Lista de Usuarios ===== */
    List<Usuario> listaUsuarios = widget.listaUsuarios;

    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de usuarios'),
        ),
        body: ListView.builder(
            itemCount: listaUsuarios.length,
            itemBuilder: ((context, index) {
              return ListTile(
                onTap: () async {
                  final usuarioActualizado = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ModifyScreen(
                                usuarioModificar: listaUsuarios[index],
                              )));
                  setState(() {
                    if(usuarioActualizado != null){
                      listaUsuarios.removeAt(index);
                      listaUsuarios.insert(index, usuarioActualizado);
                      print(listaUsuarios[index].nombre);

                      showDialog(
                        context: context,
                        builder: (_) => const AlertDialog(
                              title: Text('Actualización'),
                              content:
                                  Text('El usuario fue actualizado con éxito'),
                            ));
                    }

                    
                  });
                },
                onLongPress: () {},
                title: Text(listaUsuarios[index].nombre),
                subtitle: Text(listaUsuarios[index].escolaridad),
                leading: const Icon(Icons.supervised_user_circle),
              );
            })));
  }
}
