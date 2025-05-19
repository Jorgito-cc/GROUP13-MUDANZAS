import 'package:flutter/material.dart';
import 'formulario_unidades_sharedprefs.dart';

class RellenarCotizacionScreen extends StatefulWidget {
  @override
  _RellenarCotizacionScreenState createState() => _RellenarCotizacionScreenState();
}

class _RellenarCotizacionScreenState extends State<RellenarCotizacionScreen> {
  final List<Map<String, dynamic>> muebles = [
    {"nombre": "Heladera", "cantidad": 0},
    {"nombre": "Cocina", "cantidad": 0},
    {"nombre": "Colchón", "cantidad": 0},
    {"nombre": "Sofá", "cantidad": 0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona Muebles'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  '¿Qué muebles deseas cotizar?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ...muebles.map((item) => _buildMuebleItem(item)).toList(),
              ],
            ),
          ),

          // 🔘 Botón Siguiente
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: _irASiguiente,
              icon: Icon(Icons.arrow_forward),
              label: Text("Siguiente"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMuebleItem(Map<String, dynamic> item) {
    return Card(
      child: ListTile(
        title: Text(item['nombre']),
        subtitle: Text("Cantidad: ${item['cantidad']}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.settings, color: Colors.deepPurple),
              onPressed: () => _abrirConfiguracion(context, item),
            ),
            if (item['cantidad'] > 0)
              IconButton(
                icon: Icon(Icons.visibility, color: Colors.green),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FormularioUnidadesScreen(
                        titulo: item['nombre'],
                        cantidad: item['cantidad'],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  void _abrirConfiguracion(BuildContext context, Map<String, dynamic> item) {
    int cantidadTemp = item['cantidad'] ?? 0;

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Configurar ${item['nombre']}"),
          content: Row(
            children: [
              Text("Cantidad: "),
              const SizedBox(width: 10),
              DropdownButton<int>(
                value: cantidadTemp,
                items: List.generate(6, (index) {
                  return DropdownMenuItem(
                    value: index,
                    child: Text(index.toString()),
                  );
                }),
                onChanged: (value) {
                  setState(() {
                    cantidadTemp = value!;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                if (cantidadTemp == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Debe elegir una cantidad > 0")),
                  );
                  return;
                }

                setState(() {
                  item['cantidad'] = cantidadTemp;
                });

                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FormularioUnidadesScreen(
                      titulo: item['nombre'],
                      cantidad: cantidadTemp,
                    ),
                  ),
                );
              },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

  void _irASiguiente() {
    final seleccionados = muebles.where((m) => m['cantidad'] > 0).toList();

    if (seleccionados.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Debes seleccionar al menos un mueble con cantidad mayor a 0")),
      );
      return;
    }

    // 🔁 Aquí se puede guardar en memoria o pasar como argumento
    Navigator.pushNamed(context, '/cotizacion-final'); // Cambia esta ruta según necesites
  }
}
