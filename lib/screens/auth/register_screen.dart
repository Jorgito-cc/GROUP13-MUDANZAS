import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _direccionController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _urlProfileController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage({required bool fromCamera}) async {
    final XFile? image = await _picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 85,
    );

    if (image == null) return;

    final bytes = await File(image.path).readAsBytes();
    final base64Image = base64Encode(bytes);

    debugPrint(
      "📸 Imagen seleccionada desde ${fromCamera ? "Cámara" : "Galería"}",
    );
    debugPrint("🕗 Subiendo imagen a Imgur...");
    debugPrint("📤 Base64 size: ${base64Image.length} bytes");

    final response = await http.post(
      Uri.parse('https://api.imgur.com/3/image'),
      headers: {'Authorization': 'Client-ID 4a3b1edaccd5a70'},
      body: {'image': base64Image},
    );

    debugPrint("📥 Respuesta de Imgur: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final imageUrl = data['data']['link'];
      setState(() {
        _urlProfileController.text = imageUrl;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('✅ Imagen subida correctamente')));
    } else {
      print("❌ Error al subir imagen: ${response.body}");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('❌ Error al subir imagen')));
    }
  }

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
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          _urlProfileController.text.isNotEmpty
                              ? NetworkImage(_urlProfileController.text)
                              : null,
                      child:
                          _urlProfileController.text.isEmpty
                              ? Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.white,
                              )
                              : null,
                      backgroundColor: Colors.cyan,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      icon: Icon(Icons.add_a_photo),
                      label: Text("Agregar Imagen"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed:
                          () => showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder:
                                (context) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.camera_alt),
                                      title: Text('Tomar foto'),
                                      onTap: () {
                                        Navigator.pop(context);
                                        _pickImage(fromCamera: true);
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.photo_library),
                                      title: Text('Elegir de galería'),
                                      onTap: () {
                                        Navigator.pop(context);
                                        _pickImage(fromCamera: false);
                                      },
                                    ),
                                  ],
                                ),
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
                    _buildInput(_direccionController, "Dirección"),
                    _buildInput(_telefonoController, "Teléfono"),
                    _buildInput(
                      _urlProfileController,
                      "Foto de Perfil (URL opcional)",
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          if (_nameController.text.isEmpty ||
                              _emailController.text.isEmpty ||
                              _passwordController.text.isEmpty ||
                              _telefonoController.text.isEmpty ||
                              _direccionController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Completa todos los campos."),
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
                            "📍 Dirección: ${_direccionController.text}",
                          );
                          debugPrint(
                            "📱 Teléfono: ${_telefonoController.text}",
                          );
                          debugPrint(
                            "🖼️ URL imagen subida: ${_urlProfileController.text}",
                          );

                          await authProvider.registerCliente(
                            context: context,
                            nombre: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            direccion: _direccionController.text,
                            telefono: _telefonoController.text,
                            profileIcon: _urlProfileController.text,
                          );
                        } catch (e) {
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
