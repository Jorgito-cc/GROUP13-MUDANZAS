/* import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(ShoppitApp());
}

class ShoppitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoppit',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/login',
      routes: appRoutes,
    );
  }
}
 */
/* import 'package:flutter/material.dart';
import 'screens/customer/home_screen.dart';
import 'screens/customer/quote_screen.dart';
import 'widgets/mudanza_nacional_screen.dart'; // Para Mudanza Nacional
import 'widgets/mudanza_internacional_screen.dart'; // Para Mudanza Internacional
import 'widgets/servicio1_screen.dart'; // Para Servicio 1

import 'screens/auth/login_screen.dart';  // Ruta para Login



import 'core/theme.dart';

void main() {
  runApp(MudanzasGoApp());
}

class MudanzasGoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mudanzas Go!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.cyan[800], 
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/quote': (context) => QuoteScreen(),
        '/mudanza-nacional': (context) => MudanzaNacionalScreen(),
        '/mudanza-internacional': (context) => MudanzaInternacionalScreen(),
        '/servicio1': (context) => Servicio1Screen(),
     
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'screens/customer/home_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/customer/quote_screen.dart';
import 'core/theme.dart';



import 'screens/auth/login_screen.dart';

import 'screens/employee/employee_panel_screen.dart';

import 'screens/admin/dashboard_screen.dart';


void main() {
  runApp(MudanzasGoApp());
}

class MudanzasGoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mudanzas Go!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.cyan[800], // El mismo celeste eléctrico
      ),
      initialRoute: '/login',  // Cambié esto para que la app comience en el Login
      routes: {
        '/login': (context) => LoginScreen(),  // Asegúrate de tener una pantalla Login
        '/register': (context) => RegisterScreen(),  // Si no tienes esta pantalla, crea una
        '/home': (context) => HomeScreen(),
        '/quote': (context) => QuoteScreen(), // Aquí va la pantalla de cotización
        '/admin': (context) => AdminDashboardScreen(),
        '/employe': (context) => EmployeePanelScreen()
      },
    );
  }
}