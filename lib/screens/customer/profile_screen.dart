import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final nombreController = TextEditingController(text: auth.nombre);
    final emailController = TextEditingController(text: auth.token); // 👈 Si tienes email, puedes mostrarlo si lo guardas
    final fechaNacimientoController = TextEditingController(); // Aquí iría si tienes el campo
    final telefonoController = TextEditingController(); // Aquí también

    return Scaffold(
      appBar: AppBar(
        title: Text("Mi Perfil"),
        backgroundColor: Colors.cyan[800],
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/coco.png', fit: BoxFit.cover),
          ),
          Container(color: Colors.black.withOpacity(0.5)),
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  'Información del Cliente',
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: nombreController,
                  enabled: false,
                  style: TextStyle(color: Colors.white),
                  decoration: _buildInputDecoration("Nombre"),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  enabled: false,
                  style: TextStyle(color: Colors.white),
                  decoration: _buildInputDecoration("Correo"),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: fechaNacimientoController,
                  enabled: false,
                  style: TextStyle(color: Colors.white),
                  decoration: _buildInputDecoration("Fecha de Nacimiento"),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: telefonoController,
                  enabled: false,
                  style: TextStyle(color: Colors.white),
                  decoration: _buildInputDecoration("Teléfono"),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Funcionalidad en construcción')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    "Editar Perfil",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.white),
      filled: true,
      fillColor: Colors.white24,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    );
  }
}
