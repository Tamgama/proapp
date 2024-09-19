import 'package:flutter/material.dart';
import 'package:proapp/screens/profile_screen/profile.dart';

class CreateProfileScreen extends StatefulWidget {
  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  String _selectedNominaFile = '';

  // Mapa para almacenar los datos del perfil
  Map<String, dynamic> profileData = {
    'Nombre': null,
    'Correo electrónico': null,
    'Cuenta bancaria': null,
    'Nóminas': null,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Campo de nombre
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nombre Completo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu nombre.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Campo de correo electrónico
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Correo Electrónico'),
                validator: _validateEmail,
              ),
              SizedBox(height: 16),

              // Campo de cuenta bancaria
              TextFormField(
                controller: _accountController,
                decoration:
                    InputDecoration(labelText: 'Cuenta Bancaria (IBAN)'),
                validator: _validateBankAccount,
              ),
              SizedBox(height: 16),

              // Selección de archivo de nómina
              ElevatedButton(
                onPressed: _pickNominaFile,
                child: Text(_selectedNominaFile.isEmpty
                    ? 'Cargar nómina (PDF, JPG, PNG)'
                    : _selectedNominaFile),
              ),
              SizedBox(height: 16),

              // Botón para completar el registro
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    profileData['Nombre'] = _nameController.text;
                    profileData['Correo electrónico'] = _emailController.text;
                    profileData['Cuenta bancaria'] = _accountController.text;
                    profileData['Nóminas'] = _selectedNominaFile;

                    // Navegar a la pantalla de perfil completado
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProfileScreen(profileData: profileData),
                      ),
                    );
                  }
                },
                child: Text('Completar Registro'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Validación del correo electrónico
  String? _validateEmail(String? value) {
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (value == null || !emailRegex.hasMatch(value)) {
      return 'Introduce un correo electrónico válido.';
    }
    return null;
  }

  // Validación de cuenta bancaria
  String? _validateBankAccount(String? value) {
    final RegExp bankRegex = RegExp(r'^[A-Z]{2}\d{22}$');
    if (value == null || !bankRegex.hasMatch(value)) {
      return 'Introduce una cuenta bancaria válida (formato IBAN).';
    }
    return null;
  }

  // Simulación de la selección de archivo
  Future<void> _pickNominaFile() async {
    setState(() {
      _selectedNominaFile = 'nomina.pdf'; // Simulación
    });
  }
}
