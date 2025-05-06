import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class RegisterScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _direccionController = TextEditingController();
  final _urlProfileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/coco.png', fit: BoxFit.cover),
          ),
          Container(color: Colors.black.withOpacity(0.6)),

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
                    _buildInput(
                      _passwordController,
                      "Contraseña",
                      isPassword: true,
                    ),
                    _buildInput(_telefonoController, "Teléfono"),
                    _buildInput(_direccionController, "Dirección"),
                    _buildInput(
                      _urlProfileController,
                      "Foto de Perfil (URL opcional)",
                    ),

                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          // Validación
                          if (_nameController.text.isEmpty ||
                              _emailController.text.isEmpty ||
                              _passwordController.text.isEmpty ||
                              _telefonoController.text.isEmpty ||
                              _direccionController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Por favor, llena todos los campos obligatorios.",
                                ),
                              ),
                            );
                            return;
                          }

                          debugPrint("🟢 Registro iniciado");
                          debugPrint("📛 Nombre: ${_nameController.text}");
                          debugPrint("📧 Email: ${_emailController.text}");
                          debugPrint(
                            "🔐 Password: ${_passwordController.text}",
                          );
                          debugPrint(
                            "📱 Teléfono: ${_telefonoController.text}",
                          );
                          debugPrint(
                            "📍 Dirección: ${_direccionController.text}",
                          );
                          debugPrint(
                            "🖼️ Imagen (opcional): ${_urlProfileController.text}",
                          );

                          await authProvider.registerCliente(
                            context: context,
                            nombre: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            telefono: _telefonoController.text,
                            direccion: _direccionController.text,
                            profileIcon: _urlProfileController.text,
                          );
                        } catch (e) {
                          debugPrint("❌ Error de registro: $e");
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(e.toString())));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        "Registrarse",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("¿Ya tienes cuenta? Inicia sesión"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput(
    TextEditingController controller,
    String label, {
    bool isPassword = false,
  }) {
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
