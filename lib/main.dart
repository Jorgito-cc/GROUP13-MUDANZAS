import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/customer/home_screen.dart';
import 'screens/admin/dashboard_screen.dart';
import 'screens/employee/employee_panel_screen.dart';
import 'screens/chofer/chofer_panel_screen.dart';
import 'providers/auth_provider.dart';



import 'package:shared_preferences/shared_preferences.dart';



import '../screens/customer/profile_screen.dart';
import '../screens/customer/servicio_local_screen.dart';
import '../screens/customer/servicio_nacional_screen.dart';
import '../screens/customer/contacto_screen.dart';






import 'screens/customer/catalogo_screen.dart';
import 'screens/customer/vehicle_info_screen.dart';
import 'screens/customer/solicitar_servicio_screen.dart';
import 'screens/customer/payment_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    child: MudanzasGoApp(),
  ));
}

class MudanzasGoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        return MaterialApp(
          title: 'Mudanzas Go!',
          debugShowCheckedModeBanner: false,
          initialRoute: authProvider.isAuthenticated ? _routeFor(authProvider.rol) : '/login',
          routes: {
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/home': (context) => HomeScreen(),
            '/admin': (context) => AdminDashboardScreen(),
            '/employee': (context) => EmployeePanelScreen(),
            '/chofer': (context) => ChoferPanelScreen(),
            '/perfil': (context) => ProfileScreen(),
            '/servicio-local': (context) => ServicioLocalScreen(),
            '/servicio-nacional': (context) => ServicioNacionalScreen(),
            '/contacto': (_) => ContactoScreen(),

            // 👇 Añade las rutas que faltaban:
            '/catalogo': (_) => CatalogoScreen(),
            '/detalle-vehiculo': (_) => VehicleInfoScreen(),
            '/solicitar-servicio': (_) => SolicitarServicioScreen(),
            '/payment': (_) => PaymentScreen(),
          },
        );
      },
    );
  }

  String _routeFor(String? rol) {
    switch (rol) {
      case 'ADMIN':
        return '/admin';
      case 'EMPLEADO':
        return '/employee';
      case 'CHOFER':
        return '/chofer';
      case 'CLIENTE':
      default:
        return '/home';
    }
  }
}
