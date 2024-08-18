import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proapp/main.dart';
import 'package:proapp/screens/registration/registration.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: appState.isProfileCreated
            ? _buildUserProfile(appState)
            : _buildProfileActions(context),
      ),
    );
  }

  Widget _buildProfileActions(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _showRegistrationForm(context);
            },
            child: Text('Crear Perfil'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Lógica para entrar al perfil existente
              Provider.of<MyAppState>(context, listen: false).enterProfile();
            },
            child: Text('Entrar en el Perfil'),
          ),
        ],
      ),
    );
  }

  Widget _buildUserProfile(MyAppState appState) {
    // Este es el código que ya tienes implementado para mostrar el perfil del usuario.
    // Aquí puedes colocar la UI del perfil ya creada.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(appState.profileImageUrl),
        ),
        SizedBox(height: 16),
        Text(
          appState.userName,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        // Aquí colocarías el resto de la información del perfil que tienes en el código anterior.
      ],
    );
  }

  void _showRegistrationForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: RegistrationFormScreen(),
        );
      },
    );
  }
}