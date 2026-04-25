import 'package:flutter/material.dart';

class ResponsiveHelper {
  // Get screen width
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Get screen height
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Check if device is mobile (phone)
  static bool isMobile(BuildContext context) {
    return screenWidth(context) < 600;
  }

  // Check if device is tablet
  static bool isTablet(BuildContext context) {
    return screenWidth(context) >= 600 && screenWidth(context) < 1200;
  }

  // Check if device is desktop
  static bool isDesktop(BuildContext context) {
    return screenWidth(context) >= 1200;
  }

  // Get number of columns based on screen size
  static int getCrossAxisCount(BuildContext context) {
    if (isMobile(context)) return 2;
    if (isTablet(context)) return 3;
    return 4; // Desktop
  }

  // Get font size responsive
  static double getFontSize(BuildContext context, double size) {
    if (isMobile(context)) return size;
    if (isTablet(context)) return size * 1.2;
    return size * 1.4; // Desktop
  }

  // Get padding responsive
  static EdgeInsets getScreenPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(12);
    }
    if (isTablet(context)) {
      return const EdgeInsets.all(24);
    }
    return const EdgeInsets.all(32); // Desktop
  }

  // Get card aspect ratio responsive
  static double getCardAspectRatio(BuildContext context) {
    if (isMobile(context)) return 0.9;
    return 0.85; // Tablets and desktop - slightly taller cards
  }

  // Get image height responsive
  static double getImageHeight(BuildContext context) {
    if (isMobile(context)) return 200;
    if (isTablet(context)) return 250;
    return 300; // Desktop
  }

  // Get spacing responsive
  static double getSpacing(BuildContext context) {
    if (isMobile(context)) return 12;
    if (isTablet(context)) return 16;
    return 20; // Desktop
  }
  
  // Get drawer width responsive
  static double getDrawerWidth(BuildContext context) {
    if (isMobile(context)) return 280;
    if (isTablet(context)) return 320;
    return 360; // Desktop
  }
}