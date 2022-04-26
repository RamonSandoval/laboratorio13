import 'package:flutter/material.dart';

class StudentInfo extends StatelessWidget {
  final matricula;
  final name;
  final career;
  final semester;
  final phone;
  final email;

  const StudentInfo(
      {Key? key,
      required this.matricula,
      required this.name,
      required this.career,
      required this.semester,
      required this.phone,
      required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informacion del Alumno'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Text(name + matricula + career + semester + phone + email),
      ),
    );
  }
}
