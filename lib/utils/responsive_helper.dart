class ResponsiveHelper {
  static double getResponsiveMaxWidth(double screenWidth) {
    if (screenWidth < 600) {
      return screenWidth * 0.95;
    } else if (screenWidth < 1024) {
      return 600;
    } else {
      return 800;
    }
  }
}