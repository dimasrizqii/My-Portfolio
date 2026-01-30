import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 640;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 640 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Responsive font sizes
  static double fontSize(BuildContext context, double baseSize) {
    if (isMobile(context)) {
      return baseSize * 0.85;
    } else if (isTablet(context)) {
      return baseSize * 0.95;
    }
    return baseSize;
  }

  // Responsive spacing
  static double spacing(BuildContext context, double baseSpacing) {
    if (isMobile(context)) {
      return baseSpacing * 0.75;
    } else if (isTablet(context)) {
      return baseSpacing * 0.9;
    }
    return baseSpacing;
  }

  // Get number of columns for grid
  static int getCrossAxisCount(BuildContext context) {
    if (isMobile(context)) return 1;
    if (isTablet(context)) return 2;
    return 3;
  }

  // Get max width for content
  static double getMaxWidth(BuildContext context) {
    if (isDesktop(context)) return 1200;
    if (isTablet(context)) return 900;
    return width(context) * 0.9;
  }
}
