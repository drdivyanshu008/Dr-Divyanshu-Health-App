import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF4CAF50); // Healing green
  static const Color primaryDark = Color(0xFF388E3C);
  static const Color primaryLight = Color(0xFF81C784);
  
  // Accent Colors
  static const Color accent = Color(0xFFFFC107); // Golden yellow
  static const Color accentDark = Color(0xFFF57F17);
  static const Color accentLight = Color(0xFFFFE082);
  
  // Background Colors (Dark Theme)
  static const Color backgroundDark = Color(0xFF1A1A1A); // Deep charcoal
  static const Color surfaceDark = Color(0xFF2D2D2D); // Dark gray
  static const Color cardDark = Color(0xFF3A3A3A);
  
  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF); // White
  static const Color textSecondary = Color(0xFFE0E0E0); // Light gray
  static const Color textTertiary = Color(0xFFBDBDBD); // Medium gray
  static const Color textDisabled = Color(0xFF757575); // Dark gray
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);
  
  // Module Colors
  static const Color consultation = Color(0xFF4CAF50);
  static const Color ayurveda = Color(0xFF8BC34A);
  static const Color naturopathy = Color(0xFF009688);
  static const Color acupuncture = Color(0xFF00BCD4);
  static const Color nutrition = Color(0xFF03A9F4);
  static const Color yoga = Color(0xFF3F51B5);
  static const Color beauty = Color(0xFF9C27B0);
  static const Color surgery = Color(0xFFE91E63);
  static const Color ebooks = Color(0xFFFF5722);
  static const Color healthTips = Color(0xFFFF9800);
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, accentDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Shadow Colors
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowMedium = Color(0x33000000);
  static const Color shadowDark = Color(0x4D000000);
  
  // Border Colors
  static const Color borderLight = Color(0xFF424242);
  static const Color borderMedium = Color(0xFF616161);
  static const Color borderDark = Color(0xFF757575);
  
  // Overlay Colors
  static const Color overlayLight = Color(0x1AFFFFFF);
  static const Color overlayMedium = Color(0x33FFFFFF);
  static const Color overlayDark = Color(0x4DFFFFFF);
}

