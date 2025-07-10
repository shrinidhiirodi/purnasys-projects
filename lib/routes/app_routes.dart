import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/auth/login_or_create_account_screen.dart';
import '../screens/auth/create_account_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/product/product_listing_screen.dart';
import '../screens/product/product_details_screen.dart';
import '../screens/cart/cart_details_screen.dart';
import '../screens/cart/address_list_screen.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/': (context) => const HomeScreen(),
    '/login-or-create': (context) => const LoginOrCreateAccountScreen(),
    '/create-account': (context) => const CreateAccountScreen(),
    '/login': (context) => const LoginScreen(),
    '/products': (context) => const ProductListingScreen(),
    '/productDetails': (context) => const ProductDetailsScreen(),
    '/cartDetails': (context) => const CartDetailsScreen(),
    '/addressList': (context) => const AddressListScreen(),
  };
}
