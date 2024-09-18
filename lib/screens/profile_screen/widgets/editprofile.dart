import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  String _selectedNominaFile = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Campo de DNI
              TextFormField(
                controller: _dniController,
                decoration: InputDecoration(labelText: 'DNI'),
                validator: _validateDNI,
                onSaved: (value) {
                  if (value != null) {
                    _dniController.text =
                        value.toUpperCase(); // Convertir a mayúsculas
                  }
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
                decoration: InputDecoration(labelText: 'Cuenta Bancaria'),
                validator: _validateBankAccount,
              ),
              SizedBox(height: 16),

              // Selección de nóminas (solo formatos PDF, JPG, PNG)
              ElevatedButton(
                onPressed: _pickNominaFile,
                child: Text(_selectedNominaFile.isEmpty
                    ? 'Cargar nómina (PDF, JPG, PNG)'
                    : _selectedNominaFile),
              ),
              SizedBox(height: 16),

              // Botón para guardar cambios
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, {
                      'DNI': _dniController.text,
                      'Correo electrónico': _emailController.text,
                      'Cuenta bancaria': _accountController.text,
                      'Nóminas': _selectedNominaFile,
                    });
                  }
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Validación del DNI
  String? _validateDNI(String? value) {
    final RegExp dniRegex = RegExp(r'^\d{8}[A-Z]$');
    if (value == null || !dniRegex.hasMatch(value.toUpperCase())) {
      return 'El DNI debe contener 8 números y una letra mayúscula.';
    }
    return null;
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
    // Ejemplo de validación de IBAN básico. Puedes adaptarlo según el país.
    final RegExp bankRegex = RegExp(r'^[A-Z]{2}\d{22}$');
    if (value == null || !bankRegex.hasMatch(value)) {
      return 'Introduce una cuenta bancaria válida (formato IBAN).';
    }
    return null;
  }

  // Función para seleccionar un archivo de nómina (solo formatos PDF, JPG, PNG)
  Future<void> _pickNominaFile() async {
    // Aquí deberías usar un picker de archivos (por ejemplo, `file_picker` package).
    // Solo se acepta PDF, JPG, PNG.
    // Por ahora, simularemos la selección de un archivo:
    String filePath =
        '../assets/nomina.png'; // Simulación de selección de archivo.
    if (filePath.endsWith('.pdf') ||
        filePath.endsWith('.jpg') ||
        filePath.endsWith('.png')) {
      setState(() {
        _selectedNominaFile = filePath;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Solo se permiten archivos PDF, JPG o PNG.')),
      );
    }
  }
}
