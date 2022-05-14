import 'package:crud_con_apirest/api/peticioneshttp.dart';
import 'package:crud_con_apirest/models/mensajeros.dart';
import 'package:crud_con_apirest/screens/adicionar.dart';
import 'package:crud_con_apirest/screens/perfil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListaMensajeros extends StatefulWidget {
  final title;
  ListaMensajeros({Key? key, required this.title}) : super(key: key);

  @override
  State<ListaMensajeros> createState() => _ListaMensajerosState();
}

class _ListaMensajerosState extends State<ListaMensajeros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Mensajeros'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AgregarMensajero())).then((value) {
                  setState(() {
                    getInfo(context);
                  });
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: getInfo(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.update),
      ),
    );
  }
}

Widget getInfo(BuildContext context) {
  return FutureBuilder(
      future: listaMensajeros(http.Client()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          /* Estado de espera de la peticion */
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          /**/
          case ConnectionState.done:
            return snapshot.data != null
                ? VistaMensajeros(mensajeros: snapshot.data)
                : const Text('No Hay Datos');

          default:
            return const Text('Recargar los Datos');
        }
      });
}

class VistaMensajeros extends StatelessWidget {
  final List<Mensajero> mensajeros;
  const VistaMensajeros({
    Key? key,
    required this.mensajeros,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mensajeros.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Perfilmensajero(
                          perfil: mensajeros, idperfil: posicion)));
            },
            leading: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(mensajeros[posicion].foto!),
                      radius: 100.0,
                    )),
              ],
            ),
            title: Text(mensajeros[posicion].nombre),
            subtitle: Text(mensajeros[posicion].moto),
            trailing: Container(
              width: 80,
              height: 50,
              color: Colors.yellow,
              child: Text(mensajeros[posicion].placa),
            ),
          );
        });
  }
}
