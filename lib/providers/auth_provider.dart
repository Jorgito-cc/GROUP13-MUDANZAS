// =============================
// 1. auth_provider.dart
// =============================
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;
  String? _rol;
  String? _nombre;

  String? get token => _token;
  String? get rol => _rol;
  String? get nombre => _nombre;
  bool get isAuthenticated => _token != null;

  AuthProvider() {
    _loadFromPrefs();
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    _rol = prefs.getString('rol');
    _nombre = prefs.getString('nombre');
    notifyListeners();
  }

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    print('[LOGIN] Email ingresado: \$email');
    print('[LOGIN] Password ingresado: \$password');

    final url = Uri.parse('${ApiService.baseUrl}/auth/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );

    print('[LOGIN] Código de respuesta: \${response.statusCode}');
    print('[LOGIN] Respuesta JSON: \${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _token = data['token'];
      _rol = data['user']['rol']['nombre'];
      _nombre = data['user']['nombre'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', _token!);
      await prefs.setString('rol', _rol!);
      await prefs.setString('nombre', _nombre!);

      print('[LOGIN] Token guardado: \$_token');
      print('[LOGIN] Rol detectado: \$_rol');
      print('[LOGIN] Usuario: \$_nombre');

      notifyListeners();
      _redirectUserByRole(context);
    } else {
      throw Exception('Error al iniciar sesión: \${response.body}');
    }
  }

  Future<void> registerCliente({
    required BuildContext context,
    required String nombre,
    required String email,
    required String password,
    required String telefono,
    required String direccion,
    String? profileIcon,
  }) async {
    print(
      '[REGISTRO] Datos enviados:\nNombre: \$nombre\nEmail: \$email\nPassword: \$password\nTeléfono: \$telefono\nDirección: \$direccion\nURL Imagen: \$profileIcon',
    );

    final url = Uri.parse('${ApiService.baseUrl}/auth/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "nombre": nombre,
        "email": email,
        "password": password,
        "telefono": telefono,
        "direccion": direccion,
        "profile_icon": profileIcon,
      }),
    );

    print('[REGISTRO] Código de respuesta: \${response.statusCode}');
    print('[REGISTRO] Respuesta JSON: \${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registro exitoso. Inicia sesión.")),
      );
      Navigator.pop(context);
    } else {
      throw Exception('Error al registrar: \${response.body}');
    }
  }

  Future<void> logout(BuildContext context) async {
    _token = null;
    _rol = null;
    _nombre = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    notifyListeners();
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _redirectUserByRole(BuildContext context) {
    switch (_rol) {
      case 'ADMINISTRADOR':
        Navigator.pushReplacementNamed(context, '/admin');
        break;
      case 'AYUDANTE':
        Navigator.pushReplacementNamed(context, '/employee');
        break;
      case 'CHOFER':
        Navigator.pushReplacementNamed(context, '/chofer');
        break;
      case 'CLIENTE':
      default:
        Navigator.pushReplacementNamed(context, '/home');
        break;
    }
  }
}
