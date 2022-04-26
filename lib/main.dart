import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'info.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //lista
  List<Estudiante> _estudiantes = [
    Estudiante('18760478', 'Ramon Sandoval P.', 'Ing. Sistemas', '8',
        '6462014556', 'al18760478@ite.edu.mx'),
    Estudiante('18760465', 'Daniel Hernandez', 'Ing. Electromecanica', '8',
        '6461205321', 'al1860465@ite.edu.mx'),
    Estudiante('1860469', 'Jesus Martin Bedoy V.', 'Ing. Electromecanica', '8',
        '6469119111', 'al18760469@ite.edu.mx'),
    Estudiante('1860479', 'Armando Casas', 'Ing. Electronica', '6',
        '6461839021', 'al18760479@ite.edu.mx'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Estudiantes 8SA'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ListView.builder(
              itemCount: _estudiantes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StudentInfo()));
                  },
                  title: Text(_estudiantes[index].name),
                  leading: CircleAvatar(
                      child: Text(_estudiantes[index].name.substring(0, 1))),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              }),
        ),
      ),
    );
  }

  _borrarEstudiante(context, estudiante) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                title: Text('Eliminar estudiante'),
                content: Text("Seguro que desea eliminiar a " +
                    estudiante.name +
                    ' del grupo?'),
                actions: [
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar"),
                  ),
                  CupertinoButton(
                      child: const Text('Eliminar',
                          style: TextStyle(color: Colors.red)),
                      onPressed: () {
                        print(estudiante.name);
                        this.setState(() {
                          this._estudiantes.remove(estudiante);
                        });
                        Navigator.pop(context);
                      })
                ]));
  }
}

class Estudiante {
  String matricula;
  String name;
  String career;
  String semester;
  String phone;
  String email;

  Estudiante(this.matricula, this.name, this.career, this.semester, this.phone,
      this.email);
}
