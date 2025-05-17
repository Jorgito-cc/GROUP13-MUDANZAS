
import 'package:flutter/material.dart';

class CotizacionScreen extends StatelessWidget {
  final String direccionOrigen = "La Plata, B1766 La Tablada, Provincia de B";
  final String direccionDestino =
      "Av. Buenos Aires, Gral. Deheza, Córdoba, Argentina";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario Inicial'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSelector("¿Quiere el servicio con Embalaje?", ["Sí", "No"]),
              const SizedBox(height: 12),
              _buildSelector("Seleccione el tipo de Viaje", ["Local", "Nacional"]),
              const SizedBox(height: 12),
              _buildSelector("Seleccione el Tipo de Residencia",
                  ["Vivienda", "Comercio", "Edificio/Empresa"]),
              const SizedBox(height: 24),

              // Direcciones
              _buildInput("¿Dónde comienza tu mudanza?", direccionOrigen),
              const SizedBox(height: 16),
              _buildInput("¿Hacia dónde te mudamos?", direccionDestino),
              const SizedBox(height: 24),

              // Mapa estático
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/mapa.jpg',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Distancia
              Center(
                child: Text(
                  'Distancia: 622 km',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelector(String label, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: options.map((option) {
            return ChoiceChip(
              label: Text(option),
              selected: false,
              onSelected: (_) {},
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildInput(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 4),
        TextFormField(
          initialValue: value,
          readOnly: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}
