class User {
  String nombre;
  String email;
  String password;

  User({
    required this.nombre,
    required this.email,
    required this.password,
  });

  // Convertir el modelo a un mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'email': email,
      'password': password,
    };
  }
}
