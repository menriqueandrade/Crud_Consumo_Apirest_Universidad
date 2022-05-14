import 'package:crud_con_apirest/api/peticioneshttp.dart';
import 'package:flutter/material.dart';


class AgregarMensajero extends StatefulWidget {
  AgregarMensajero({Key? key}) : super(key: key);

  @override
  State<AgregarMensajero> createState() => _AgregarMensajeroState();
}

class _AgregarMensajeroState extends State<AgregarMensajero> {
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlfoto = TextEditingController();
  TextEditingController controlplaca = TextEditingController();
  TextEditingController controltelefono = TextEditingController();
  TextEditingController controlwhatsapp = TextEditingController();
  TextEditingController controlmoto = TextEditingController();
  bool soat = false;
  bool tecno = false;
  bool activo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Mensajero"),
        
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Center(
          child: ListView(
            children: [
              TextField(
                controller: controlNombre,
                decoration: InputDecoration(labelText: 'Ingrese el Nombre'),
              ),
              TextField(
                controller: controlfoto,
                decoration: InputDecoration(labelText: 'Ingrese la foto'),
              ),
              TextField(
                controller: controlplaca,
                decoration: InputDecoration(labelText: 'Ingrese la placa'),
              ),
              TextField(
                controller: controltelefono,
                decoration: InputDecoration(labelText: 'Ingrese el Telefono'),
              ),
              TextField(
                controller: controlwhatsapp,
                decoration: InputDecoration(labelText: 'Ingrese el Whatsapp'),
              ),
              TextField(
                controller: controlmoto,
                decoration: const InputDecoration(labelText: 'Ingrese la marca de la moto'),
              ),
             

              SwitchListTile(
                title: Text('Soat Vigente?'),
                value: soat,
                onChanged: (bool value) {
                  setState(() {
                    soat = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Tecno mecanica vigente?'),
                value: tecno,
                onChanged: (bool value) {
                  setState(() {
                    tecno = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Esta activo el mensajero?'),
                value: activo,
                onChanged: (bool value) {
                  setState(() {
                    activo = value;
                  });
                },
              ),

              ElevatedButton(onPressed: (){
                String soatresult='NO';
                String tecnoresult='NO';
                String activoresult='NO';
                soat ? soatresult = 'SI' : soatresult ='NO';
                tecno ? tecnoresult = 'SI' : tecnoresult ='NO';
                activo ? activoresult = 'SI' : activoresult ='NO';

                adicionarMensajero(controlNombre.text, controlfoto.text, controlplaca.text, controltelefono.text, controlwhatsapp.text, controlmoto.text, soatresult, tecnoresult, activoresult);
                Navigator.pop(context);
              }, child: Text('Agregar Mensajero'))

            ],
          ),
        ),
      ),
    );
  }
}