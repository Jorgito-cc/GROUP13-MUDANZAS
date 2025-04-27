/* import 'package:flutter/material.dart';

class ServicioLocalScreen extends StatelessWidget {
  final List<String> zonas = [
    'Zona Norte',
    'Zona Sur',
    'Zona Este',
    'Zona Oeste',
    'Centro',
    'La Ramada',
    'Plan 3000',
    'Doble vía La Guardia',
    'Av. Banzer'
  ];

  final List<Map<String, String>> beneficios = [
    {
      'titulo': 'Servicio Personalizado',
      'descripcion': 'Nos adaptamos a tus necesidades para que tu mudanza local sea ágil y segura.'
    },
    {
      'titulo': 'Cobertura Total',
      'descripcion': 'Llegamos a todas las zonas urbanas y rurales de Santa Cruz.'
    },
    {
      'titulo': 'Equipo Profesional',
      'descripcion': 'Contamos con personal capacitado y confiable para el manejo de tus pertenencias.'
    },
    {
      'titulo': 'Empaque de Calidad',
      'descripcion': 'Materiales resistentes y seguros para proteger tus objetos durante el traslado.'
    },
    {
      'titulo': 'Vehículos Equipados',
      'descripcion': 'Modernas unidades de transporte adaptadas a todo tipo de mudanza.'
    },
    {
      'titulo': 'Atención Inmediata',
      'descripcion': 'Contáctanos y te responderemos en minutos para coordinar tu servicio.'
    },
    {
      'titulo': 'Seguimiento en Tiempo Real',
      'descripcion': 'Podés conocer el estado de tu mudanza desde tu teléfono.'
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
                const SizedBox(height: 60),
                Text(
                  "Mudanzas locales seguras y rápidas en Santa Cruz",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  "Ofrecemos cobertura total en los principales distritos y zonas de Santa Cruz:",
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Column(
                  children: zonas.map((zona) {
                    return ListTile(
                      leading: Icon(Icons.location_on, color: Colors.white),
                      title: Text(zona, style: TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),
                Text(
                  "¿Por qué elegirnos?",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: beneficios.map((item) {
                    return Card(
                      color: Colors.white24,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(
                          item['titulo']!,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          item['descripcion']!,
                          style: TextStyle(color: Colors.white70),
                        ),
                        leading: Icon(Icons.check_circle_outline, color: Colors.orangeAccent),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/contacto');
                  },
                  icon: Icon(Icons.phone),
                  label: Text("Contáctanos"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 30),
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
import 'package:google_maps_flutter/google_maps_flutter.dart'; // 👈 Import obligatorio

class ServicioLocalScreen extends StatelessWidget {
  final List<String> zonas = [
    'Zona Norte',
    'Zona Sur',
    'Zona Este',
    'Zona Oeste',
    'Centro',
    'La Ramada',
    'Plan 3000',
    'Doble vía La Guardia',
    'Av. Banzer',
  ];

  final List<Map<String, String>> beneficios = [
    {
      'titulo': 'Servicio Personalizado',
      'descripcion': 'Nos adaptamos a tus necesidades para que tu mudanza local sea ágil y segura.',
    },
    {
      'titulo': 'Cobertura Total',
      'descripcion': 'Llegamos a todas las zonas urbanas y rurales de Santa Cruz.',
    },
    {
      'titulo': 'Equipo Profesional',
      'descripcion': 'Contamos con personal capacitado y confiable para el manejo de tus pertenencias.',
    },
    {
      'titulo': 'Empaque de Calidad',
      'descripcion': 'Materiales resistentes y seguros para proteger tus objetos durante el traslado.',
    },
    {
      'titulo': 'Vehículos Equipados',
      'descripcion': 'Modernas unidades de transporte adaptadas a todo tipo de mudanza.',
    },
    {
      'titulo': 'Atención Inmediata',
      'descripcion': 'Contáctanos y te responderemos en minutos para coordinar tu servicio.',
    },
    {
      'titulo': 'Seguimiento en Tiempo Real',
      'descripcion': 'Podrás conocer el estado de tu mudanza desde tu teléfono.',
    },
  ];

  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(-17.7833, -63.1821), // Santa Cruz de la Sierra
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicio Local'),
        backgroundColor: Colors.cyan[800],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🖼 Banner
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/mudanzalocal.jpg'), // <-- tu banner
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Text(
                    'Mudanzas locales seguras y rápidas en Santa Cruz',
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

            // 📍 Zonas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Text(
                    'Cobertura en Zonas:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: zonas.map((zona) {
                      return Chip(
                        label: Text(zona),
                        backgroundColor: Colors.cyan.shade100,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 🗺️ Google Map (opcional ocultarlo luego)
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
                  visible: false, // 👈 Cambia a true cuando quieras mostrar el mapa
                  child: GoogleMap(
                    initialCameraPosition: _initialPosition,
                    markers: {
                      Marker(
                        markerId: MarkerId('SantaCruz'),
                        position: LatLng(-17.7833, -63.1821),
                        infoWindow: InfoWindow(title: 'Santa Cruz de la Sierra'),
                      ),
                    },
                    zoomControlsEnabled: false,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // 🏆 Beneficios
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Text(
                    '¿Por qué elegirnos?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...beneficios.map((beneficio) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.check_circle, color: Colors.orangeAccent),
                        title: Text(
                          beneficio['titulo']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(beneficio['descripcion']!),
                      ),
                    );
                  }).toList(),
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
              label: const Text("Cotizar Mudanza"),
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
