import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/customer/home_screen.dart';
/* import '../screens/customer/cart_screen.dart'; */
/* import '../screens/customer/payment_screen.dart'; */
import '../screens/admin/dashboard_screen.dart';
import '../screens/admin/manage_products_screen.dart';
import '../screens/employee/employee_panel_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/login': (_) => LoginScreen(),
  '/register': (_) => RegisterScreen(),
  '/home': (_) => HomeScreen(),
  /* '/cart': (_) => CartScreen(), */
 /*  '/payment': (_) => PaymentScreen(), */
  '/admin': (_) => AdminDashboardScreen(),
  '/employee': (_) => EmployeePanelScreen(),
  '/manage-products': (_) => ManageProductsScreen(),
};
