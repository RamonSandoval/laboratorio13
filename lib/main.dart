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
    Estudiante(
      '1860490',
      'Alfonso Victoria P.',
      'Ing. Industrial',
      '7',
      '6462192093',
      'al1860490@ite.edu.mx',
    ),
    Estudiante('1860479', 'Armando Casas F.', 'Ing. Electronica', '6',
        '6461839021', 'al18760479@ite.edu.mx'),
    Estudiante('18760465', 'Daniel Hernandez V.', 'Ing. Electromecanica', '8',
        '6461205321', 'al1860465@ite.edu.mx'),
    Estudiante('1860480', 'Felipe Ferras G.', 'Ing. Mecatronica', '3',
        '6462901842', 'al1860480@ite.edu.mx'),
    Estudiante('1860469', 'Jesus Martin Bedoy V.', 'Ing. Electromecanica', '8',
        '6469119111', 'al18760469@ite.edu.mx'),
    Estudiante('18760478', 'Ramon Sandoval P.', 'Ing. Sistemas', '8',
        '6462014556', 'al18760478@ite.edu.mx'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(41, 39, 46, 300),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: const Text(
              'Estudiantes',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ListView.builder(
              itemCount: _estudiantes.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  height: 90,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentInfo(
                                    name: _estudiantes[index].name,
                                    matricula: _estudiantes[index].matricula,
                                    career: _estudiantes[index].career,
                                    semester: _estudiantes[index].semester,
                                    phone: _estudiantes[index].phone,
                                    email: _estudiantes[index].email,
                                  )));
                    },
                    title: Text(
                      _estudiantes[index].name,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    subtitle: Text(_estudiantes[index].career,
                        style: TextStyle(
                            color: Color.fromARGB(255, 138, 138, 138),
                            fontSize: 12)),
                    leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(247, 235, 137, 10),
                        child: Text(
                          _estudiantes[index].name.substring(0, 1),
                          style: TextStyle(
                              color: Color.fromARGB(247, 255, 255, 255)),
                        )),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
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
