import 'package:flutter/material.dart';

class AppColors {
  // Background Colors
  static const Color bgDark = Color(0xFF0A0E27);
  static const Color bgCard = Color(0xFF1A1F3A);
  static const Color bgCardLight = Color(0xFF252B48);

  // Gradient Colors
  static const Color gradientStart = Color(0xFF00D9FF); // Cyan
  static const Color gradientMiddle = Color(0xFF6366F1); // Indigo
  static const Color gradientEnd = Color(0xFFA855F7); // Purple

  // Accent Colors
  static const Color accentCyan = Color(0xFF00D9FF);
  static const Color accentPurple = Color(0xFFA855F7);
  static const Color accentPink = Color(0xFFEC4899);

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B3C1);
  static const Color textTertiary = Color(0xFF6B7285);

  // Functional Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // Gradient Definitions
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [gradientStart, gradientMiddle, gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF1A1F3A), Color(0xFF252B48)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient hoverGradient = LinearGradient(
    colors: [gradientStart.withOpacity(0.3), gradientEnd.withOpacity(0.3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
