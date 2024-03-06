import 'package:flutter/material.dart';
import 'package:wawamentor/presentation/widgets/my_button.dart';

class UpdateFormScreen extends StatefulWidget {
  const UpdateFormScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  UpdateFormScreenState createState() => UpdateFormScreenState();
}

class UpdateFormScreenState extends State<UpdateFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Datos actuales
  String _firstName = "Maritza";
  String _secondName = "Elizabeth";
  final String _lastName = "Rodríguez";
  final String _secLastName = "Encalda";
  final String _idCed = "1724301294";
  final String _userProvince = "Pichincha";
  final String _userCity = "Quito";
  final String _userAddress = "24 de mayo e imbabura";
  String _birthdate = "1990-02-05";
  final String _gender = "F";
  final String _phone1 = "0923141605";
  final String _phone2 = "";
  final String _userMail = "maritza@wayrawawa.com";
  final String _userPassword = "HM109edc88";
  final String _accountStatus = "1";
  final String _userPhoto = "maritza.png";
  final String _creationUser = "1";

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _birthdate =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Actualizar Datos Estudiante',
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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  initialValue: _firstName,
                  decoration: const InputDecoration(
                    labelText: 'Primer Nombre *',
                    hintText: '* campo obligatorio',
                  ),
                  onSaved: (value) => _firstName = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Debe llenar este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _secondName,
                  decoration: const InputDecoration(
                    labelText: 'Segundo Nombre',
                    hintText: 'Opcional',
                  ),
                  onSaved: (value) => _secondName = value!,
                ),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Fecha de Nacimiento',
                      ),
                      controller: TextEditingController(
                          text: _selectedDate != null
                              ? _selectedDate!.toString().substring(0, 10)
                              : ''),
                    ),
                  ),
                ),
                TextFormField(
                  initialValue: _lastName,
                  decoration: const InputDecoration(
                    labelText: 'Apellido',
                    hintText: '* campo obligatorio',
                  ),
                  onSaved: (value) => _firstName = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Debe llenar este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _secLastName,
                  decoration: const InputDecoration(
                    labelText: 'Segundo Apellido',
                    hintText: 'Opcional',
                  ),
                  onSaved: (value) => _secondName = value!,
                ),
                TextFormField(
                  initialValue: _idCed,
                  decoration: const InputDecoration(
                    labelText: 'CI:',
                    hintText: '* campo obligatorio',
                  ),
                  onSaved: (value) => _firstName = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Debe llenar este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _phone1,
                  decoration: const InputDecoration(
                    labelText: 'Teléfono principal',
                    hintText: '* campo obligatorio',
                  ),
                  onSaved: (value) => _firstName = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Debe llenar este campo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _phone2,
                  decoration: const InputDecoration(
                    labelText: 'teléfono secundario',
                    hintText: 'Opcional',
                  ),
                  onSaved: (value) => _secondName = value!,
                ),
                // Otros campos TextFormField con valores iniciales aquí...
                const SizedBox(height: 20),
                MyButton(
                    onPressed: () {
                      // Enviar el formulario
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Aquí iría la lógica para enviar los datos actualizados al servidor o guardarlos localmente
                        // Puedes acceder a los valores actualizados utilizando las variables correspondientes
                      } else {
                        // Muestra el diálogo de advertencia
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Advertencia'),
                              content: const Text(
                                  'Debe llenar todos los campos obligatorios.'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    text: 'Crear Usuario'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
