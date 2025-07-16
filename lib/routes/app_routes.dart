import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/auth/login_or_create_account_screen.dart';
import '../screens/auth/create_account_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/product/product_listing_screen.dart';
import '../screens/product/product_details_screen.dart';
import '../screens/cart/cart_details_screen.dart';
import '../screens/cart/address_list_screen.dart';
import '../screens/orders/order_details_screen.dart';
import '../screens/orders/my_orders_list_screen.dart';
import '../screens/product/product_feedback_screen.dart';
import '../screens/organizations/organization_list_screen.dart';
import '../screens/organizations/organization_details_screen.dart';
import '../screens/teams/team_list_screen.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/': (context) => const HomeScreen(),
    '/login-or-create': (context) => const LoginOrCreateAccountScreen(),
    '/create-account': (context) => const CreateAccountScreen(),
    '/login': (context) => const LoginScreen(),
    '/products': (context) => const ProductListingScreen(),
    '/product-details': (context) => const ProductDetailsScreen(),
    '/cart-details': (context) => const CartDetailsScreen(),
    '/address-list': (context) => const AddressListScreen(),
    '/order-details': (context) => const OrderDetailsScreen(),
    '/productFeedback': (context) => const ProductFeedbackScreen(),
    '/myOrdersList': (context) => const MyOrdersListScreen(),
    '/orderDetails': (context) => const OrderDetailsScreen(),
    '/organizationList': (context) => const OrganizationListScreen(),
    '/organizationDetails': (context) => const OrganizationDetailsScreen(),
    '/teamsList': (context) => const TeamListScreen(),

  };
}
