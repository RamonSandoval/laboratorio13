import 'package:flutter/material.dart';

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
          title: const Text('Material App Bar'),
        ),
        body: ListView.builder(
            itemCount: _estudiantes.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(_estudiantes[index].name +
                      '' +
                      _estudiantes[index].matricula +
                      '' +
                      _estudiantes[index].career +
                      '' +
                      _estudiantes[index].semester +
                      '' +
                      _estudiantes[index].phone +
                      '' +
                      _estudiantes[index].email));
            }),
      ),
    );
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
