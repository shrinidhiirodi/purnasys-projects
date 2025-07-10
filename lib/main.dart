import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'screens/product/product_listing_screen.dart';
import 'screens/product/product_details_screen.dart';
import 'screens/cart/cart_details_screen.dart';
import 'screens/cart/address_list_screen.dart';

void main() {
  runApp(const EPurnaApp());
}

class EPurnaApp extends StatelessWidget {
  const EPurnaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Purna',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}
