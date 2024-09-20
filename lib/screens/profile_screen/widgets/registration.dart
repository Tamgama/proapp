import 'package:flutter/material.dart';
import 'package:proapp/screens/profile_screen/profile.dart'; // Asegúrate de que la ruta sea correcta
import 'package:proapp/screens/profile_screen/widgets/edit_profile.dart'; // Asegúrate de que la ruta sea correcta

class CreateProfileScreen extends StatefulWidget {
  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  String _selectedNominaFile = '';

  // Mapa para almacenar los datos del perfil
  Map<String, dynamic> profileData = {
    'Nombre': 'Tamara García',
    'Correo electrónico': 'tamara@gmail.com',
    'Cuenta bancaria': 'ES90 3456 3456 7890 7890',
    'Nóminas': 'null',
  };

  @override
  void dispose() {
    // Libera los controladores cuando se destruya el widget para evitar fugas de memoria
    _nameController.dispose();
    _emailController.dispose();
    _accountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Campo de nombre
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nombre completo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu nombre y apellidos.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Campo de correo electrónico
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Correo electrónico'),
                validator: _validateEmail,
              ),
              SizedBox(height: 16),

              // Campo de cuenta bancaria
              TextFormField(
                controller: _accountController,
                decoration: InputDecoration(
                    labelText: 'Cuenta bancaria (En formato IBAN)'),
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
                    // Si el formulario es válido, guardar datos
                    _formKey.currentState!.save();
                    profileData['Nombre'] = _nameController.text;
                    profileData['Correo electrónico'] = _emailController.text;
                    profileData['Cuenta bancaria'] = _accountController.text;
                    profileData['Nóminas'] = _selectedNominaFile;

                    // Navegar a la pantalla de perfil con los datos registrados
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
      return 'Introduce un correo electrónico válido, por ejemplo: mariam123@gmail.com';
    }
    return null;
  }

  // Validación de cuenta bancaria
  String? _validateBankAccount(String? value) {
    final RegExp bankRegex = RegExp(r'^[A-Z]{2}\d{22}$');
    if (value == null || !bankRegex.hasMatch(value)) {
      return 'Introduce una cuenta bancaria válida en formato IBAN';
    }
    return null;
  }

  // Simulación de la selección de archivo de nómina
  Future<void> _pickNominaFile() async {
    // Aquí puedes usar un paquete como file_picker o similar para cargar archivos
    setState(() {
      _selectedNominaFile = 'nomina.pdf'; // Simulación de selección de archivo
    });
  }
}

class UnregisteredProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Aún no  te has registrado.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de creación de perfil
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateProfileScreen()),
                );
              },
              child: Text('Crea tu perfil'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de edición de perfil (si ya tiene datos)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              },
              child: Text('Entrar en perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
