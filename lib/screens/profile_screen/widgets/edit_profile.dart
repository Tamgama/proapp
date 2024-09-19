import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final Map<String, dynamic> profileData;

  EditProfileScreen({required this.profileData});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _accountController;
  String _selectedNominaFile = '';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profileData['Nombre']);
    _emailController =
        TextEditingController(text: widget.profileData['Correo electrónico']);
    _accountController =
        TextEditingController(text: widget.profileData['Cuenta bancaria']);
    _selectedNominaFile = widget.profileData['Nóminas'] ?? '';
  }

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
          child: ListView(
            children: [
              Text('Editar Nombre',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
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
              Divider(),
              Text('Editar Correo Electrónico',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Correo Electrónico'),
                validator: _validateEmail,
              ),
              Divider(),
              Text('Editar Cuenta Bancaria',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextFormField(
                controller: _accountController,
                decoration:
                    InputDecoration(labelText: 'Cuenta Bancaria (IBAN)'),
                validator: _validateBankAccount,
              ),
              Divider(),
              ElevatedButton(
                onPressed: _pickNominaFile,
                child: Text(_selectedNominaFile.isEmpty
                    ? 'Cargar nueva nómina (PDF, JPG, PNG)'
                    : _selectedNominaFile),
              ),
              Divider(),
              SizedBox(height: 16),

              // Botón para guardar cambios
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    widget.profileData['Nombre'] = _nameController.text;
                    widget.profileData['Correo electrónico'] =
                        _emailController.text;
                    widget.profileData['Cuenta bancaria'] =
                        _accountController.text;
                    widget.profileData['Nóminas'] = _selectedNominaFile;

                    // Guardar cambios y regresar a la pantalla de perfil
                    Navigator.pop(context, widget.profileData);
                  }
                },
                child: Text('Guardar Cambios'),
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
      _selectedNominaFile = 'nomina_editada.pdf'; // Simulación
    });
  }
}
