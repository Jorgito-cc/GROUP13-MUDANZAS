import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recibimos los datos enviados desde SolicitarServicioScreen
    final Map<String, dynamic> data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final vehicle = data["vehicle"];
    final origen = data["origen"];
    final destino = data["destino"];
    final fecha = data["fecha"];
    final observaciones = data["observaciones"];

    // Simulamos un precio base
    final double precio = 500.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Resumen y Pago'),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/coco.png', fit: BoxFit.cover),
          ),
          Container(color: Colors.black.withOpacity(0.6)),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Resumen de Mudanza",
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  _buildInfo("Vehículo:", vehicle["name"]),
                  _buildInfo("Origen:", origen),
                  _buildInfo("Destino:", destino),
                  _buildInfo("Fecha:", fecha),
                  _buildInfo("Observaciones:", observaciones),
                  SizedBox(height: 20),
                  Divider(color: Colors.white24),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total a Pagar:", style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text("\$${precio.toStringAsFixed(2)}", style: TextStyle(color: Colors.orangeAccent, fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Aquí puedes integrar Stripe, MercadoPago, etc.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Pago realizado con éxito 🚚✅")),
                        );
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: Text(
                        "Pagar Ahora",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.white70)),
          SizedBox(width: 8),
          Expanded(child: Text(value, style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
