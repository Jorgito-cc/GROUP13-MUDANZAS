/* import 'package:flutter/material.dart';

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
 */
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // 👈 Importante aunque el mapa esté oculto

class ServicioNacionalScreen extends StatelessWidget {
  final List<Map<String, String>> servicios = [
    {
      "titulo": "Mudanzas Empresariales",
      "descripcion": "Servicios adaptados para oficinas pequeñas hasta grandes corporaciones.",
      "icono": "work",
    },
    {
      "titulo": "Mudanzas Personales",
      "descripcion": "Cuidamos cada detalle para que tu mudanza sea segura y sin estrés.",
      "icono": "home",
    },
    {
      "titulo": "Empaque Profesional",
      "descripcion": "Protección total con materiales de alta calidad.",
      "icono": "inventory",
    },
    {
      "titulo": "Seguro de Mudanza",
      "descripcion": "Opciones de seguro para mayor tranquilidad.",
      "icono": "shield",
    },
    {
      "titulo": "Almacenamiento Temporal",
      "descripcion": "Espacios seguros para tus bienes en tránsito.",
      "icono": "warehouse",
    },
    {
      "titulo": "Mudanza con Mascotas",
      "descripcion": "Traslado cómodo y seguro para tus mascotas.",
      "icono": "pets",
    },
    {
      "titulo": "Cobertura Nacional",
      "descripcion": "Llevamos tus pertenencias a cualquier rincón de Bolivia.",
      "icono": "map",
    },
  ];

  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(-16.2902, -63.5887), // Bolivia Centro
    zoom: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicio Nacional'),
        backgroundColor: Colors.cyan[800],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🖼 Banner principal
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/mudanzanacional.jpg'), // <-- Banner nacional
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Text(
                    'Mudanzas nacionales seguras y eficientes en Bolivia',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🌎 Google Map (oculto por ahora)
            Container(
              height: 250,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Visibility(
                  visible: false, // 👈 Por ahora oculto
                  child: GoogleMap(
                    initialCameraPosition: _initialPosition,
                    markers: {
                      Marker(
                        markerId: MarkerId('BoliviaCentro'),
                        position: LatLng(-16.2902, -63.5887),
                        infoWindow: InfoWindow(title: 'Centro de Bolivia'),
                      ),
                    },
                    zoomControlsEnabled: false,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // 🚛 Servicios
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Text(
                    'Nuestros Servicios:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: servicios.map((servicio) {
                      IconData icono = Icons.local_shipping;
                      switch (servicio['icono']) {
                        case "work":
                          icono = Icons.work;
                          break;
                        case "home":
                          icono = Icons.home;
                          break;
                        case "inventory":
                          icono = Icons.inventory;
                          break;
                        case "shield":
                          icono = Icons.shield;
                          break;
                        case "warehouse":
                          icono = Icons.warehouse;
                          break;
                        case "pets":
                          icono = Icons.pets;
                          break;
                        case "map":
                          icono = Icons.map;
                          break;
                      }
                      return Card(
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.42,
                          padding: EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Icon(icono, size: 40, color: Colors.orangeAccent),
                              const SizedBox(height: 8),
                              Text(
                                servicio['titulo']!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                servicio['descripcion']!,
                                style: TextStyle(fontSize: 13, color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 📞 Botón de Cotizar
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/contacto');
              },
              icon: const Icon(Icons.phone),
              label: const Text('Cotizar Mudanza Nacional'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
