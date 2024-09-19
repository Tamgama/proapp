import 'package:flutter/material.dart';
import 'package:proapp/screens/profile_screen/widgets/edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> profileData;

  ProfileScreen({required this.profileData});

  @override
  Widget build(BuildContext context) {
    double completionPercentage = _calculateCompletionPercentage(profileData);

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil Completo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: ${profileData['Nombre'] ?? 'No proporcionado'}'),
            SizedBox(height: 8),
            Text(
                'Correo Electrónico: ${profileData['Correo electrónico'] ?? 'No proporcionado'}'),
            SizedBox(height: 8),
            Text(
                'Cuenta Bancaria: ${profileData['Cuenta bancaria'] ?? 'No proporcionado'}'),
            SizedBox(height: 8),
            Text('Nómina: ${profileData['Nóminas'] ?? 'No proporcionado'}'),
            SizedBox(height: 16),

            // Mostrar porcentaje de completado
            LinearProgressIndicator(
              value: completionPercentage / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 8),
            Text(
                'Perfil Completo: ${completionPercentage.toStringAsFixed(0)}%'),

            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de edición del perfil
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      profileData: profileData,
                    ),
                  ),
                );
              },
              child: Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }

  // Calcula el porcentaje de completado
  double _calculateCompletionPercentage(Map<String, dynamic> profileData) {
    int completedFields = profileData.values
        .where((value) => value != null && value != '')
        .length;
    int totalFields = profileData.length;
    return (completedFields / totalFields) * 100;
  }
}
