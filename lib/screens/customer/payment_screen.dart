import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> datos = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final vehicle = datos["vehicle"];

    return Scaffold(
      appBar: AppBar(
        title: Text("Resumen y Pago"),
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
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Resumen del Servicio",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepOrange),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),

            _buildResumen("Vehículo", vehicle["nombre"]),
            _buildResumen("Tipo", vehicle["tipo_vehiculo"]["nombre"]),
            _buildResumen("Placa", vehicle["placa"]),
            _buildResumen("Origen", datos["origen"]),
            _buildResumen("Destino", datos["destino"]),
            _buildResumen("Fecha", datos["fecha"]),
            _buildResumen("Observaciones", datos["observaciones"] ?? "-"),
            _buildResumen("Costo por Km", "Bs. ${vehicle["coste_kilometraje"]}"),

            SizedBox(height: 30),

            ElevatedButton.icon(
              icon: Icon(Icons.check_circle_outline),
              label: Text("Confirmar y Pagar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: () {
                // Simular pago o continuar a una pasarela real
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("¡Pago Realizado!"),
                    content: Text("Tu solicitud ha sido registrada correctamente."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false),
                        child: Text("Volver al inicio"),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildResumen(String titulo, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titulo, style: TextStyle(color: Colors.black54)),
          Expanded(
            child: Text(valor, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
