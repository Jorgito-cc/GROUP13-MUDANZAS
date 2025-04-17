import 'package:flutter/material.dart';

class ServicioNacionalScreen extends StatelessWidget {
  final List<Map<String, String>> cards = [
    {
      "title": "Mudanzas Empresariales",
      "description": "Servicios B2B adaptados para empresas, desde pequeñas oficinas hasta grandes corporaciones.",
      "icon": "work"
    },
    {
      "title": "Mudanzas Personales",
      "description": "Cuidamos cada detalle de tu mudanza como si fuera nuestra. Hogares felices, mudanzas sin estrés.",
      "icon": "home"
    },
    {
      "title": "Empaque Profesional",
      "description": "Utilizamos materiales de alta calidad y técnicas avanzadas para proteger tus pertenencias.",
      "icon": "inventory"
    },
    {
      "title": "Seguro de Mudanza",
      "description": "Ofrecemos opciones de seguro para que tu mudanza esté protegida en todo momento.",
      "icon": "shield"
    },
    {
      "title": "Almacenamiento Temporal",
      "description": "Espacios seguros y vigilados para almacenar tus bienes antes o después de la mudanza.",
      "icon": "warehouse"
    },
    {
      "title": "Mudanza con Mascotas",
      "description": "Nos encargamos también de tus mascotas, asegurando un traslado cómodo y seguro.",
      "icon": "pets"
    },
    {
      "title": "Cobertura Nacional",
      "description": "Realizamos mudanzas en todos los departamentos de Bolivia, sin importar la distancia.",
      "icon": "map"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/coco.png', fit: BoxFit.cover),
          ),
          Container(color: Colors.black.withOpacity(0.6)),
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80),
                Text(
                  'Mudanzas nacionales seguras y eficientes en Bolivia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Ofrecemos servicios completos de mudanza en todo el país, con atención profesional y logística especializada para empresas, hogares y necesidades especiales.',
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: cards.map((card) {
                    IconData iconData = Icons.location_city;
                    switch (card["icon"]) {
                      case "work":
                        iconData = Icons.work;
                        break;
                      case "home":
                        iconData = Icons.home;
                        break;
                      case "inventory":
                        iconData = Icons.inventory;
                        break;
                      case "shield":
                        iconData = Icons.shield;
                        break;
                      case "warehouse":
                        iconData = Icons.warehouse;
                        break;
                      case "pets":
                        iconData = Icons.pets;
                        break;
                      case "map":
                        iconData = Icons.map;
                        break;
                    }
                    return Card(
                      color: Colors.white.withOpacity(0.15),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.42,
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Icon(iconData, color: Colors.orangeAccent),
                            SizedBox(height: 8),
                            Text(
                              card["title"] ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 6),
                            Text(
                              card["description"] ?? "",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/contacto'),
                  icon: Icon(Icons.phone),
                  label: Text('Contáctanos'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
