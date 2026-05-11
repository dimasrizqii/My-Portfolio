import 'package:flutter/material.dart';

class AppColors {
  // Backgrounds
  static const Color bgDark = Color(0xFF0C0C12);
  static const Color bgCard = Color(0xFF111118);
  static const Color bgCardLight = Color(0xFF18181F);

  // Single accent - soft indigo (not neon)
  static const Color accent = Color(0xFF7C71FA);
  static const Color accentLight = Color(0xFFA89EFF);
  static const Color accentDim = Color(0xFF2D2966);

  // Text hierarchy
  static const Color textBright = Color(0xFFF0F2FF);
  static const Color textPrimary = Color(0xFFCDD2E0);
  static const Color textSecondary = Color(0xFF7A8194);
  static const Color textTertiary = Color(0xFF434857);

  // Borders (very subtle)
  static const Color border = Color(0x0FFFFFFF);
  static const Color borderHover = Color(0x1AFFFFFF);

  // Semantic aliases kept for compatibility
  static const Color accentCyan = accent;
  static const Color accentPurple = accentLight;
  static const Color accentPink = Color(0xFFBB9EFF);
  static const Color success = Color(0xFF34D399);
  static const Color warning = Color(0xFFFBBF24);
  static const Color error = Color(0xFFFC8181);
  static const Color gradientMiddle = accent;

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF7C71FA), Color(0xFFBB9EFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF111118), Color(0xFF18181F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient hoverGradient = LinearGradient(
    colors: [
      Color(0xFF7C71FA).withValues(alpha: 0.07),
      Color(0xFFBB9EFF).withValues(alpha: 0.07),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
