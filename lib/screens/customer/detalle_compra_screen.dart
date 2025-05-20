import 'package:flutter/material.dart';

class DetalleCompraScreen extends StatelessWidget {
  final Map<String, dynamic> compraEjemplo = {
    "embalaje": true,
    "tipo_viaje_id": 1,
    "tipo_residencia_id": 2,
    "origen": {
      "latitud": 1232131.1,
      "longitud": -242343.2,
      "str": "El torno, calle X, Barrio Y, casa Z"
    },
    "destino": {
      "latitud": -234234.1,
      "longitud": -123211.2,
      "str": "Cotoca, calle X, Barrio Y, casa Z"
    },
    "fecha_reserva": "2025-05-10 16:22:00",
    "distancia": 312,
    "vehiculo_id": 2,
    "inmuebles": [
      {
        "id": 3,
        "cantidad": 3,
        "formularios": [
          {"largo": 2, "ancho": 3, "alto": 1, "peso": 0.4},
          {"largo": 3, "ancho": 5, "alto": 3, "peso": 1.4},
          {"largo": 5, "ancho": 4, "alto": 6, "peso": 2.4},
        ]
      },
      {
        "id": 5,
        "cantidad": 2,
        "formularios": [
          {"largo": 0.3, "ancho": 0.4, "alto": 0.5, "peso": 0.56},
          {"largo": 0.45, "ancho": 0.85, "alto": 3, "peso": 0.99},
        ]
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    final data = compraEjemplo;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de Compra'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle("Resumen General"),
          _buildInfoRow("¿Embalaje?", data["embalaje"] ? "Sí" : "No"),
          _buildInfoRow("Tipo de viaje ID", data["tipo_viaje_id"].toString()),
          _buildInfoRow("Tipo residencia ID", data["tipo_residencia_id"].toString()),
          _buildInfoRow("Fecha reserva", data["fecha_reserva"]),
          _buildInfoRow("Distancia (km)", data["distancia"].toString()),
          _buildInfoRow("Vehículo ID", data["vehiculo_id"].toString()),

          const SizedBox(height: 16),
          _buildSectionTitle("Ubicaciones"),
          _buildInfoRow("Origen", data["origen"]["str"]),
          _buildInfoRow("Destino", data["destino"]["str"]),

          const SizedBox(height: 16),
          _buildSectionTitle("Muebles y Formularios"),
          ...data["inmuebles"].asMap().entries.map((entry) {
            final index = entry.key;
            final mueble = entry.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "🪑 Mueble ID ${mueble['id']} (x${mueble['cantidad']})",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...mueble["formularios"].asMap().entries.map((form) {
                  final i = form.key + 1;
                  final f = form.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text("🔸 Formulario $i: "
                        "L: ${f["largo"]}, A: ${f["ancho"]}, "
                        "Alt: ${f["alto"]}, P: ${f["peso"]}"),
                  );
                }).toList(),
                const Divider(),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.black54)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.orangeAccent, fontWeight: FontWeight.bold),
      ),
    );
  }
}
