import 'package:flutter/material.dart';

/// Flutter code sample for [CheckboxListTile].

class CheckboxListTileExample extends StatefulWidget {
  const CheckboxListTileExample({super.key});

  @override
  State<CheckboxListTileExample> createState() =>
      _CheckboxListTileExampleState();
}

class _CheckboxListTileExampleState extends State<CheckboxListTileExample> {
  bool checkboxValue1 = true;
  bool checkboxValue2 = true;
  bool checkboxValue3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Asistencia',
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: const Color.fromARGB(255, 17, 68, 145),
      ),
      body: Column(
        children: <Widget>[
          CheckboxListTile(
            value: checkboxValue1,
            onChanged: (bool? value) {
              setState(() {
                checkboxValue1 = value!;
              });
            },
            title: const Text('Estudiante 1'),
            //subtitle: const Text('Supporting text'),
          ),
          const Divider(height: 0),
          CheckboxListTile(
            value: checkboxValue2,
            onChanged: (bool? value) {
              setState(() {
                checkboxValue2 = value!;
              });
            },
            title: const Text('Estudiante 2'),
            // subtitle: const Text(
            //     'Longer supporting text to demonstrate how the text wraps and the checkbox is centered vertically with the text.'),
          ),
          const Divider(height: 0),
          CheckboxListTile(
            value: checkboxValue3,
            onChanged: (bool? value) {
              setState(() {
                checkboxValue3 = value!;
              });
            },
            title: const Text('Estudiante 3'),
            // subtitle: const Text(
            //     "Longer supporting text to demonstrate how the text wraps and how setting 'CheckboxListTile.isThreeLine = true' aligns the checkbox to the top vertically with the text."),
            // //isThreeLine: true,
          ),
          const Divider(height: 0),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aquí puedes agregar la lógica para guardar la asistencia en algún lugar
          // como una base de datos o en la nube.
          print('Asistencia guardada');
        },
        child: const Icon(
          Icons.save,
          color: Color.fromARGB(255, 17, 68, 145),
        ),
      ),
    );
  }
}
