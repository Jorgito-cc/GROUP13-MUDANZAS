import 'package:flutter/material.dart';

class VehicleInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vehicle = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Vehículo'),
        backgroundColor: Colors.cyan[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.cyan.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      vehicle["images"][0],
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    vehicle["name"] ?? "Nombre desconocido",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.cyan[800]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    vehicle["type"] ?? "Tipo desconocido",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  Divider(height: 30, thickness: 1),
                  _buildTechnicalInfo("Capacidad de carga", "3.5 toneladas"),
                  _buildTechnicalInfo("Motor", "Diesel 2.5L Turbo"),
                  _buildTechnicalInfo("Estado", vehicle["available"] ? "Disponible" : "No Disponible"),
                  _buildTechnicalInfo("Año de Fabricación", "2022"),
                  _buildTechnicalInfo("Seguro Incluido", "Sí"),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/solicitar-servicio', arguments: vehicle);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Text("Solicitar Mudanza", style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTechnicalInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.black54)),
          Text(value, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
