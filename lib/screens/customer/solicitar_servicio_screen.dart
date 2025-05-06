import 'package:flutter/material.dart';

class SolicitarServicioScreen extends StatefulWidget {
  @override
  _SolicitarServicioScreenState createState() => _SolicitarServicioScreenState();
}

class _SolicitarServicioScreenState extends State<SolicitarServicioScreen> {
  final _formKey = GlobalKey<FormState>();
  final _direccionOrigenController = TextEditingController();
  final _direccionDestinoController = TextEditingController();
  final _fechaController = TextEditingController();
  final _observacionesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vehicle = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitar Mudanza'),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/coco.png', fit: BoxFit.cover),
          ),
          Container(color: Colors.black.withOpacity(0.6)),
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                     vehicle["nombre"], // ✅ Esto es correcto
                    style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  _buildInput(_direccionOrigenController, "Dirección de Origen"),
                  SizedBox(height: 16),
                  _buildInput(_direccionDestinoController, "Dirección de Destino"),
                  SizedBox(height: 16),
                  _buildInput(_fechaController, "Fecha de Mudanza"),
                  SizedBox(height: 16),
                  _buildInput(_observacionesController, "Observaciones", maxLines: 3),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Aquí iría la lógica para enviar la solicitud real
                        Navigator.pushNamed(context, '/payment', arguments: {
                          "vehicle": vehicle,
                          "origen": _direccionOrigenController.text,
                          "destino": _direccionDestinoController.text,
                          "fecha": _fechaController.text,
                          "observaciones": _observacionesController.text,
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Text(
                      "Ir a Pago",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput(TextEditingController controller, String label, {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white24,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Campo requerido";
        }
        return null;
      },
    );
  }
}
