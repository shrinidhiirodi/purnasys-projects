import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

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
