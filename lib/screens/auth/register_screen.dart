import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void register(BuildContext context) {
    String username = _usernameController.text.trim();
    String firstname = _firstnameController.text.trim();
    String lastname = _lastnameController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Las contraseñas no coinciden')),
      );
    } else {
      // Aquí agrega la lógica para registrar al usuario, como enviarlo al backend
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registro exitoso')),
      );
      Navigator.pop(context); // Regresar a la pantalla de login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          SizedBox.expand(
            child: Image.asset(
              'assets/coco.png',  // Cambia aquí el nombre de la imagen al que tienes
              fit: BoxFit.cover,
            ),
          ),
          // Fondo oscuro semitransparente
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Contenido del formulario
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Regístrate',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Campos de texto con iconos y bordes redondeados
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      labelStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.person, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _firstnameController,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      labelStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.person, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _lastnameController,
                    decoration: InputDecoration(
                      labelText: 'Apellido',
                      labelStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.person, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirmar Contraseña',
                      labelStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Botón de registro
                  ElevatedButton(
                    onPressed: () => register(context),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.orangeAccent,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Registrarse',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Enlace para ir al login
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Regresar al LoginScreen
                    },
                    child: const Text(
                      '¿Ya tienes cuenta? Inicia sesión',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
