import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                'Mudanzas Go!',
                style: TextStyle(fontSize: 24),
              ),
              decoration: BoxDecoration(color: Colors.cyan[800]),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Servicios Locales'),
              onTap: () {
                Navigator.pushNamed(context, '/servicio-local');
              },
            ),
            ListTile(
              leading: Icon(Icons.public),
              title: Text('Servicios Nacionales'),
              onTap: () {
                Navigator.pushNamed(context, '/servicio-nacional');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text('Mudanzas Go!', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/perfil');
            },
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('¿Cerrar sesión?'),
                  content: Text('¿Estás seguro de que quieres cerrar sesión?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        auth.logout(context);
                      },
                      child: Text('Sí'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/coco.png', fit: BoxFit.cover),
          ),
          Container(color: Colors.black.withOpacity(0.5)),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
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
                Text(
                  'En Mudanzas Go, conectamos tu vida a nuevos comienzos. '
                  'Experimenta un servicio de mudanzas seguro, eficiente y personalizado, tanto a nivel nacional como local.\n\n'
                  'Contamos con oficinas en Av Bolivia, esq.13, donde daremos seguimiento a tu cotización. Siente el respaldo Mudanzas Go.',
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/quote');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
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
