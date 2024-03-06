import 'package:flutter/material.dart';
import 'package:wawamentor/presentation/widgets/my_button.dart';

class ConsultUserScreen extends StatefulWidget {
  const ConsultUserScreen({super.key});

  @override
  _ConsultUserScreenState createState() => _ConsultUserScreenState();
}

class _ConsultUserScreenState extends State<ConsultUserScreen> {
  String _searchValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Consultar',
          style: TextStyle(color: Colors.grey[200]),
        ),
        iconTheme: IconThemeData(color: Colors.grey[200]),
        backgroundColor: const Color.fromARGB(255, 17, 68, 145),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.grey[200],
              child: const Text(
                'Puedes consultar al usuario por la cédula de identidad o por email',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Ingrese cédula de identidad',
              ),
              onChanged: (value) {
                setState(() {
                  _searchValue = value;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Ingrese el email del usuario',
              ),
              onChanged: (value) {
                setState(() {
                  _searchValue = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            MyButton(
                onPressed: () {
                  // Aquí iría la lógica para realizar la consulta
                  // Puedes utilizar el valor de _searchValue para hacer la consulta
                  print('Consulta realizada: $_searchValue');
                },
                text: 'Consultar')
          ],
        ),
      ),
    );
  }
}
