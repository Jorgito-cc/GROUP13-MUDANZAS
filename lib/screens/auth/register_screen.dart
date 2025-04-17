import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class RegisterScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fechaNacimientoController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _urlProfileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          SizedBox.expand(
            child: Image.asset(
              'assets/coco.png', // Asegúrate de tener la imagen en assets
              fit: BoxFit.cover,
            ),
          ),
          // Capa oscura
          Container(color: Colors.black.withOpacity(0.6)),

          // Contenido principal
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      "Registro de Cliente",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan[800],
                      ),
                    ),
                    const SizedBox(height: 20),

                    _buildInput(_nameController, "Nombre"),
                    _buildInput(_emailController, "Correo"),
                    _buildInput(_passwordController, "Contraseña", isPassword: true),
                    _buildInput(_fechaNacimientoController, "Fecha de Nacimiento (YYYY-MM-DD)"),
                    _buildInput(_telefonoController, "Teléfono"),
                    _buildInput(_urlProfileController, "Foto de Perfil (URL opcional)"),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await authProvider.registerCliente(
                            context: context,
                            nombre: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            fechaNacimiento: _fechaNacimientoController.text,
                            telefono: _telefonoController.text,
                            urlProfile: _urlProfileController.text,
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(e.toString())));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        "Registrarse",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("¿Ya tienes cuenta? Inicia sesión"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput(TextEditingController controller, String label,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
