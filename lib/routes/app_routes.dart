import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/customer/home_screen.dart';
/* import '../screens/customer/cart_screen.dart'; */
/* import '../screens/customer/payment_screen.dart'; */
import '../screens/admin/dashboard_screen.dart';
/* import '../screens/admin/manage_products_screen.dart'; */
import '../screens/employee/employee_panel_screen.dart';

import '../screens/customer/profile_screen.dart';
import '../screens/customer/servicio_local_screen.dart';
import '../screens/customer/servicio_nacional_screen.dart';

import '../screens/customer/contacto_screen.dart';
import '../screens/customer/catalogo_screen.dart';
import '../screens/customer/vehicle_info_screen.dart';
import '../screens/customer/solicitar_servicio_screen.dart';
import '../screens/customer/payment_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/login': (_) => LoginScreen(),
  '/register': (_) => RegisterScreen(),
  '/home': (_) => HomeScreen(),
  /* '/cart': (_) => CartScreen(), */
 /*  '/payment': (_) => PaymentScreen(), */
  '/admin': (_) => AdminDashboardScreen(),
  '/employee': (_) => EmployeePanelScreen(),
  '/perfil': (_) => ProfileScreen(),
  '/servicio-local': (_) => ServicioLocalScreen(),
'/servicio-nacional': (_) => ServicioNacionalScreen(),
 '/contacto': (_) => ContactoScreen(),
  

  
  '/catalogo': (_) => CatalogoScreen(),
  '/detalle-vehiculo': (_) => VehicleInfoScreen(),
  '/solicitar-servicio': (_) => SolicitarServicioScreen(),
  '/payment': (_) => PaymentScreen(),
  /* '/manage-products': (_) => ManageProductsScreen(), */
};
