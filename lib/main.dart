import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/app_colors.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dimas Rizqi Ibadurrahim - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bgDark,
        colorScheme: ColorScheme.dark(
          primary: AppColors.accentCyan,
          secondary: AppColors.accentPurple,
          surface: AppColors.bgCard,
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).apply(
          fontFamilyFallback: [
            'Apple Color Emoji',
            'Segoe UI Emoji',
            'Segoe UI Symbol',
            'Noto Color Emoji',
          ],
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
