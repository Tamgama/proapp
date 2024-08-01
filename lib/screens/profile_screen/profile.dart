import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  final double profileCompletion =
      1; // Porcentaje de completitud del perfil (por ejemplo, 100%)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://www.example.com/profile.jpg'), // Reemplaza con la URL de la imagen de perfil
            ),
            SizedBox(height: 16),
            Text(
              'Tamara García',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildProfileCompletion(),
            SizedBox(height: 16),
            _buildContactSection(context),
            SizedBox(height: 16),
            _buildDocumentsSection(context),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón de edición
              },
              child: Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCompletion() {
    if (profileCompletion >= 1.0) {
      return Column(
        children: [
          Icon(Icons.check_circle,
              color: Color.fromARGB(255, 20, 70, 21), size: 48),
          SizedBox(height: 8),
          Text(
            'Perfil completado',
            style: TextStyle(
                fontSize: 18, color: const Color.fromARGB(255, 0, 0, 0)),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          LinearProgressIndicator(
            value: profileCompletion,
            minHeight: 10,
          ),
          SizedBox(height: 8),
          Text(
            'Verificación del perfil: ${(profileCompletion * 100).toInt()}%',
            style: TextStyle(fontSize: 16),
          ),
        ],
      );
    }
  }

  Widget _buildContactSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contacto',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ListTile(
          leading: Icon(Icons.phone, color: Colors.black),
          title: Text('123-456-7890'),
          trailing: _buildTrailingIcon(context, true, 'móvil'),
        ),
        ListTile(
          leading: Icon(Icons.phone, color: Colors.black),
          title: Text('098-765-4321'),
          trailing: _buildTrailingIcon(context, false, 'otro teléfono'),
        ),
        ListTile(
          leading: Icon(Icons.email, color: Colors.black),
          title: Text('usuario@example.com'),
          trailing: _buildTrailingIcon(context, true, 'correo'),
        ),
      ],
    );
  }

  Widget _buildDocumentsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Documentos',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ListTile(
          leading:
              Icon(Icons.assignment_ind, color: Color.fromARGB(255, 0, 0, 0)),
          title: Text('DNI: 12345678X'),
          trailing: _buildTrailingIcon(context, true, 'DNI'),
        ),
        ListTile(
          leading: Icon(Icons.assignment, color: Color.fromARGB(255, 0, 0, 0)),
          title: Text('Nóminas: Completo'),
          trailing: _buildTrailingIcon(context, true, 'nóminas'),
        ),
        ListTile(
          leading: Icon(Icons.credit_card, color: Color.fromARGB(255, 0, 0, 0)),
          title: Text('Cuenta bancaria: Completo'),
          trailing: _buildTrailingIcon(context, true, 'nóminas'),
        ),
      ],
    );
  }

  Widget _buildTrailingIcon(
      BuildContext context, bool isComplete, String item) {
    if (isComplete) {
      return Icon(Icons.check_circle, color: Color.fromARGB(255, 20, 70, 21));
    } else {
      return IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: () {
          _showAddItemDialog(context, item);
        },
      );
    }
  }

  void _showAddItemDialog(BuildContext context, String item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Añadir $item'),
          content: Text('Añadir $item correspondiente.'),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Añadir'),
              onPressed: () {
                // Acción para añadir el ítem
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
