import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_colors.dart';

class SkillChip extends StatefulWidget {
  final String name;
  final IconData icon;

  const SkillChip({super.key, required this.name, required this.icon});

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          gradient: _isHovered ? AppColors.cardGradient : null,
          color: _isHovered ? null : AppColors.bgCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 2,
            color: _isHovered
                ? AppColors.accentCyan.withOpacity(0.5)
                : Colors.white.withOpacity(0.1),
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.accentCyan.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              widget.icon,
              color: _isHovered
                  ? AppColors.accentCyan
                  : AppColors.textSecondary,
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              widget.name,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 15,
                fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
