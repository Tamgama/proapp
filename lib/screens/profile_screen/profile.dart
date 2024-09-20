import 'package:flutter/material.dart';
import 'package:proapp/screens/profile_screen/widgets/edit_profile.dart'; // Asegúrate de que la ruta sea correcta
import 'package:provider/provider.dart';
import 'package:proapp/main.dart'; // Asegúrate de que la ruta sea correcta

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState =
        Provider.of<MyAppState>(context); // Acceso al estado global

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Condición para mostrar el perfil si está creado o las acciones si no lo está
        child: appState.isProfileCreated
            ? _buildUserProfile(appState) // Muestra el perfil si existe
            : _buildProfileActions(
                context), // Muestra opciones si no hay perfil
      ),
    );
  }

  // Muestra las acciones cuando no hay un perfil creado
  Widget _buildProfileActions(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _showRegistrationForm(context); // Abre el formulario de registro
            },
            child: Text('Crear perfil'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Lógica para intentar entrar al perfil inexistente
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('No te has registrado aún.'),
              ));
            },
            child: Text('Entrar en el perfil'),
          ),
        ],
      ),
    );
  }

  // Muestra la UI del perfil cuando ya está creado
  Widget _buildUserProfile(MyAppState appState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(
              'assets/profile.png'), // Asegúrate de tener esta imagen
        ),
        SizedBox(height: 16),
        Text(
          appState.profileData['Nombre'] ?? 'Nombre no proporcionado',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        ListTile(
          leading: Icon(Icons.assignment_ind),
          title:
              Text('DNI: ${appState.profileData['DNI'] ?? 'No proporcionado'}'),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text(
              'Correo: ${appState.profileData['Correo electrónico'] ?? 'No proporcionado'}'),
        ),
        ListTile(
          leading: Icon(Icons.credit_card),
          title: Text(
              'Cuenta bancaria: ${appState.profileData['Cuenta bancaria'] ?? 'No proporcionado'}'),
        ),
        ListTile(
          leading: Icon(Icons.assignment),
          title: Text(
              'Nóminas: ${appState.profileData['Nóminas'] ?? 'No proporcionado'}'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () async {
            // Abre la pantalla de edición del perfil
            final result = await Navigator.push<Map<String, String>>(
              context,
              MaterialPageRoute(builder: (context) => EditProfileScreen()),
            );
            if (result != null) {
              appState
                  .createProfile(result); // Actualiza el perfil si hay cambios
            }
          },
          child: Text('Editar Perfil'),
        ),
      ],
    );
  }

  // Mostrar el formulario de registro
  void _showRegistrationForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: RegistrationFormScreen(), // Formulario de registro
        );
      },
    );
  }
}
