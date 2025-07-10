import 'package:flutter/material.dart';

class ResponsiveHelper {
  static double getResponsiveMaxWidth(double screenWidth) {
    if (screenWidth < 600) return screenWidth * 0.95;
    if (screenWidth < 1200) return 600;
    return 800;
  }
}
