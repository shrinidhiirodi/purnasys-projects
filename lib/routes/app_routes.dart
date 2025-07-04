import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/auth/login_or_create_account_screen.dart';
import '../screens/auth/create_account_screen.dart';
import '../screens/auth/login_screen.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/': (context) => const HomeScreen(),
    '/login-or-create': (context) => const LoginOrCreateAccountScreen(),
    '/create-account': (context) => const CreateAccountScreen(),
    '/login': (context) => const LoginScreen(),
  };
}
