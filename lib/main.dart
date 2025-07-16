import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'screens/product/product_listing_screen.dart';
import 'screens/product/product_details_screen.dart';
import 'screens/cart/cart_details_screen.dart';
import 'screens/cart/address_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // <-- Ensure binding is initialized before anything else

  GestureBinding.instance?.resampleEnabled = true; // optional
  runApp(const EPurnaApp());
}

extension on GestureBinding {
  set resampleEnabled(bool resampleEnabled) {}
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
