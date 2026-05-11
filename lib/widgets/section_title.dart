import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionTitle({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Small accent label above
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Text(
              subtitle!.toUpperCase(),
              style: TextStyle(
                color: AppColors.accent,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 3,
              ),
            ),
          ),

        // Main title — clean white, bold
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textBright,
            fontSize: 38,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.8,
            height: 1.1,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 20),

        // Thin accent underline
        Container(
          width: 40,
          height: 2,
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      ],
    );
  }
}
