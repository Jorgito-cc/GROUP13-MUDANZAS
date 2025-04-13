import 'package:flutter/material.dart';
import '../../widgets/navbar.dart'; // Para el navbar
import '../../core/theme.dart'; // Para el tema
import '../customer/quote_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Navbar(), // Reemplaza con tu propio navbar
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          SizedBox.expand(
            child: Image.asset('assets/coco.png', fit: BoxFit.cover),
          ),
          // Fondo oscuro con opacidad
          Container(
            color: Colors.black.withOpacity(0.5),
            height: double.infinity,
          ),
          // Contenido principal
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Título
                Text(
                  'Mudanzas para Todos tus Destinos',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                // Subtítulo
                Text(
                  'En Mudanzas Go, conectamos tu vida a nuevos comienzos. '
                  'Experimenta un servicio de mudanzas seguro, eficiente y personalizado, tanto a nivel nacional como Local.\n\n'
                  'Contamos con oficinas en Av Bolivia,esqu.13, '
                  'donde daremos seguimiento a tu cotización. Siente el respaldo Mudanzas Go.',
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),

                // Botón de Cotización
                ElevatedButton(
                  onPressed: () {
                    // Acción al presionar el botón
                    Navigator.pushNamed(
                      context,
                      '/quote',
                    ); // Aquí va la ruta de cotización
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent, // Botón rojo
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                  ),
                  child: Text(
                    'Cotiza tu mudanza',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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
