import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:proapp/screens/profile_screen/widgets/editprofile.dart';
=======
import 'package:provider/provider.dart';
import 'package:proapp/main.dart';
import 'package:proapp/screens/registration/registration.dart';
>>>>>>> e82424832573d06051b4e9703de76c4721b3c079

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

<<<<<<< HEAD
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double profileCompletion =
      0.0; // Inicializamos el porcentaje de completitud del perfil.

  // Mapa que guarda los datos actuales del perfil.
  Map<String, String> _profileData = {
    'Número de teléfono': '',
    'Correo electrónico': '',
    'DNI': '',
    'Cuenta bancaria': '',
    'Nóminas': '',
  };

  @override
  void initState() {
    super.initState();
    // Calcula el porcentaje de completitud al inicio.
    _calculateProfileCompletion();
  }

  // Función para calcular el porcentaje de completitud del perfil.
  void _calculateProfileCompletion() {
    int totalFields =
        _profileData.length; // Total de campos que se deben completar.
    int completedFields = _profileData.values
        .where((value) => value.isNotEmpty)
        .length; // Campos completados.
    setState(() {
      profileCompletion =
          completedFields / totalFields; // Calcula el porcentaje.
    });
  }

=======
>>>>>>> e82424832573d06051b4e9703de76c4721b3c079
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
<<<<<<< HEAD
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen de perfil
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            SizedBox(height: 16),
            // Nombre del usuario
            Text(
              'Tamara García',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Indicador de completitud del perfil
            _buildProfileCompletion(),
            SizedBox(height: 16),
            // Botón para editar perfil en el medio
            _buildEditProfileButton(context),
            SizedBox(height: 16),
            // Sección de contacto
            _buildContactSection(),
            SizedBox(height: 16),
            // Sección de documentos
            _buildDocumentsSection(),
          ],
        ),
=======
        child: appState.isProfileCreated
            ? _buildUserProfile(appState)
            : _buildProfileActions(context),
>>>>>>> e82424832573d06051b4e9703de76c4721b3c079
      ),
    );
  }

<<<<<<< HEAD
  // Botón para editar perfil (solo el texto en negrita).
  Widget _buildEditProfileButton(BuildContext context) {
    return TextButton(
      onPressed: () async {
        // Navega a la pantalla de edición y espera los datos de retorno.
        final result = await Navigator.push<Map<String, String>>(
          context,
          MaterialPageRoute(builder: (context) => EditProfileScreen()),
        );
        // Si el usuario añade información, actualizamos el perfil.
        if (result != null) {
          setState(() {
            _profileData.addAll(result);
            _calculateProfileCompletion(); // Recalculamos el porcentaje de completitud.
          });
        }
      },
      child: Text(
        'Editar Perfil',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  // Construir el indicador de completitud del perfil.
  Widget _buildProfileCompletion() {
    if (profileCompletion >= 1.0) {
      // Si el perfil está completo, muestra un icono de check.
      return Column(
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 30),
          SizedBox(height: 8),
          Text(
            'Perfil completado',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      );
    } else {
      // Si el perfil no está completo, muestra el porcentaje de progreso.
      return Column(
        children: [
          LinearProgressIndicator(
            value: profileCompletion, // Progreso actual.
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

  // Construir la sección de contacto.
  Widget _buildContactSection() {
=======
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
>>>>>>> e82424832573d06051b4e9703de76c4721b3c079
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(appState.profileImageUrl),
        ),
        SizedBox(height: 16),
        Text(
<<<<<<< HEAD
          'Contacto',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ListTile(
          leading: Icon(Icons.phone, color: Colors.black),
          title: Text(_profileData['Número de teléfono']!.isNotEmpty
              ? _profileData['Número de teléfono']!
              : 'No proporcionado'),
        ),
        ListTile(
          leading: Icon(Icons.email, color: Colors.black),
          title: Text(_profileData['Correo electrónico']!.isNotEmpty
              ? _profileData['Correo electrónico']!
              : 'No proporcionado'),
=======
          appState.userName,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
>>>>>>> e82424832573d06051b4e9703de76c4721b3c079
        ),
        SizedBox(height: 16),
        // Aquí colocarías el resto de la información del perfil que tienes en el código anterior.
      ],
    );
  }

<<<<<<< HEAD
  // Construir la sección de documentos.
  Widget _buildDocumentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Documentos',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ListTile(
          leading: Icon(Icons.assignment_ind, color: Colors.black),
          title: Text(_profileData['DNI']!.isNotEmpty
              ? _profileData['DNI']!
              : 'No proporcionado'),
        ),
        ListTile(
          leading: Icon(Icons.credit_card, color: Colors.black),
          title: Text(_profileData['Cuenta bancaria']!.isNotEmpty
              ? _profileData['Cuenta bancaria']!
              : 'No proporcionado'),
        ),
        ListTile(
          leading: Icon(Icons.assignment, color: Colors.black),
          title: Text(_profileData['Nóminas']!.isNotEmpty
              ? _profileData['Nóminas']!
              : 'No proporcionado'),
        ),
      ],
    );
  }
}
=======
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
>>>>>>> e82424832573d06051b4e9703de76c4721b3c079
