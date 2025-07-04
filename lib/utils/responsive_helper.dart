class ResponsiveHelper {
  static double getResponsiveMaxWidth(double screenWidth) {
    if (screenWidth >= 800) return 800;
    if (screenWidth >= 500) return 500;
    return screenWidth * 0.9;
  }
}
