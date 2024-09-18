import 'package:flutter/material.dart';


class RegistrationFormScreen extends StatefulWidget {
  const RegistrationFormScreen({Key? key}) : super(key: key);

  @override
  _RegistrationFormScreenState createState() => _RegistrationFormScreenState();
}

class _RegistrationFormScreenState extends State<RegistrationFormScreen> {
  String _selectedProfileType = 'Interesado'; // Tipo de perfil seleccionado
  String _selectedCity = 'Murcia'; // Ejemplo de menú desplegable
  String _selectedExperienceLevel = 'Principiante'; // Ejemplo de opciones

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado del formulario
              Center(
                child: Text(
                  'Crea tu Perfil',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Pregunta 1: Selección de tipo de perfil
              _buildDropdownQuestion(
                'Tipo de Perfil:',
                _selectedProfileType,
                ['Interesado', 'Agente', 'Vendedor/Propietario'],
                (value) => setState(() => _selectedProfileType = value),
              ),
              SizedBox(height: 16),

              // Pregunta 2: Selección de ciudad
              _buildDropdownQuestion(
                'Ciudad:',
                _selectedCity,
                ['Murcia', 'Madrid', 'Barcelona', 'Valencia'],
                (value) => setState(() => _selectedCity = value),
              ),
              SizedBox(height: 16),

              // Pregunta 3: Nivel de experiencia (opciones)
              _buildOptionsQuestion(
                'Nivel de Experiencia:',
                _selectedExperienceLevel,
                ['Principiante', 'Intermedio', 'Avanzado'],
                (value) => setState(() => _selectedExperienceLevel = value),
              ),
              SizedBox(height: 16),

              // Pregunta 4: Nombre Completo
              _buildTextField('Nombre Completo', 'Introduce tu nombre'),

              SizedBox(height: 24),

              // Botón para enviar el formulario
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Guardar la información del perfil
                      Provider.of<MyAppState>(context, listen: false).createProfile(
                        _selectedProfileType,
                        _selectedCity,
                        _selectedExperienceLevel,
                        // Otros campos que se capturan
                      );

                      // Cerrar el formulario y mostrar el perfil
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text('Crear Perfil'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownQuestion(String label, String value, List<String> options,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          items: options.map<DropdownMenuItem<String>>((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionsQuestion(String label, String value, List<String> options,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Column(
          children: options.map((option) {
            return RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: value,
              onChanged: onChanged,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingresa $label';
            }
            return null;
          },
        ),
      ],
    );
  }
}
