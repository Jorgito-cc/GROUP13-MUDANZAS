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
    SharedPreferences prefs = await SharedPreferences.getInstance();
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
    final url = Uri.parse(
      '${ApiService.baseUrl}/auth/login',
    ); // Ruta actualizada

    final res = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      _token = data['token'];
      _rol = data['usuario']['rol']['nombre'];
      _nombre = data['usuario']['nombre'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', _token!);
      await prefs.setString('rol', _rol!);
      await prefs.setString('nombre', _nombre!);

      notifyListeners();

      _redirectUserByRole(context);
    } else {
      throw Exception('Error de login: ${res.body}');
    }
  }

  void _redirectUserByRole(BuildContext context) {
    switch (_rol) {
      case 'ADMIN':
        Navigator.pushReplacementNamed(context, '/admin');
        break;
      case 'EMPLEADO':
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

  //REGISTAR CLIENTE
  Future<void> registerCliente({
    required BuildContext context,
    required String nombre,
    required String email,
    required String password,
    required String fechaNacimiento,
    required String telefono,
    String? urlProfile,
  }) async {
    final url = Uri.parse('${ApiService.baseUrl}/cliente/registrar');

    final res = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "nombre": nombre,
        "email": email,
        "password": password,
        "fecha_nacimiento": fechaNacimiento,
        "telefono": telefono,
        "url_profile": urlProfile,
      }),
    );

    if (res.statusCode == 200 || res.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registro exitoso. Inicia sesión.")),
      );
      Navigator.pop(context);
    } else {
      throw Exception('Error al registrar: ${res.body}');
    }
  }

  Future<void> logout(BuildContext context) async {
    _token = null;
    _rol = null;
    _nombre = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    notifyListeners();
    Navigator.pushReplacementNamed(context, '/login');
  }
}



// Es para registar admin 

/* Future<void> register(String nombre, String email, String password, BuildContext context) async {
  final url = Uri.parse('${ApiService.baseUrl}/auth/register');  // Ruta actualizada
  final res = await http.post(url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({"nombre": nombre, "email": email, "password": password}),

  );

  if (res.statusCode == 200 || res.statusCode == 201) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Registro exitoso. Inicia sesión.")));
    Navigator.pop(context);
  } else {
    throw Exception('Error al registrar: ${res.body}');
  }
}
 */