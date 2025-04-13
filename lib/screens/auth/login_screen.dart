import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // Simulación de usuarios
    final users = {
      'admin': {'password': '1234', 'role': 'admin'},
      'empleado': {'password': '1234', 'role': 'empleado'},
      'cliente': {'password': '1234', 'role': 'cliente'},
    };

    if (users.containsKey(username) &&
        users[username]!['password'] == password) {
      String role = users[username]!['role']!;
      handleLoginResponse(role);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuario o contraseña incorrectos')),
      );
    }
  }

  void handleLoginResponse(String role) {
    if (role == 'admin') {
      Navigator.pushReplacementNamed(context, '/admin');
    } else if (role == 'empleado') {
      Navigator.pushReplacementNamed(context, '/employee');
    } else {
      Navigator.pushReplacementNamed(context, '/home');
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
              'assets/coco.png', // Ruta de la imagen
              fit: BoxFit.cover, // Ajusta la imagen al tamaño de la pantalla
            ),
          ),
          // Fondo oscuro con opacidad
          Container(color: Colors.black.withOpacity(0.5)),
          // Contenido principal
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Mudanzas Go!',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Título de bienvenida
                  const Text(
                    'Bienvenido de nuevo',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  const SizedBox(height: 30),

                  // Formulario de login
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Campo de usuario con icono
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Usuario',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.person, color: Colors.white),
                            filled: true,
                            fillColor: Colors.white24,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Campo de contraseña con icono
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.lock, color: Colors.white),
                            filled: true,
                            fillColor: Colors.white24,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),

                        // Botón de login
                        ElevatedButton(
                          onPressed: login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            padding: EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 30,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Iniciar sesión',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Enlace para registrarse
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text(
                            '¿No tienes cuenta? Regístrate',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
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
