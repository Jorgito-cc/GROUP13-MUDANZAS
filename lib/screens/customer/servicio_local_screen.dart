import 'package:flutter/material.dart';

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
