import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/responsive.dart';

class HeaderBar extends StatelessWidget {
  final String activeSection;
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const HeaderBar({
    super.key,
    required this.activeSection,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.spacing(context, 40),
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: AppColors.bgDark.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo/Name
          GestureDetector(
            onTap: onHomeTap,
            child: ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.primaryGradient.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
              child: Text(
                isMobile ? "DR" : "Dimas Rizqi",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),

          // Navigation Links (hide on mobile)
          if (!isMobile)
            Row(
              children: [
                _HeaderNavButton(
                  label: "Home",
                  onTap: onHomeTap,
                  isActive: activeSection == 'Home',
                ),
                const SizedBox(width: 8),
                _HeaderNavButton(
                  label: "About",
                  onTap: onAboutTap,
                  isActive: activeSection == 'About',
                ),
                const SizedBox(width: 8),
                _HeaderNavButton(
                  label: "Skills",
                  onTap: onSkillsTap,
                  isActive: activeSection == 'Skills',
                ),
                const SizedBox(width: 8),
                _HeaderNavButton(
                  label: "Projects",
                  onTap: onProjectsTap,
                  isActive: activeSection == 'Projects',
                ),
                const SizedBox(width: 8),
                _HeaderNavButton(
                  label: "Contact",
                  onTap: onContactTap,
                  isActive: activeSection == 'Contact',
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _HeaderNavButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const _HeaderNavButton({
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  @override
  State<_HeaderNavButton> createState() => _HeaderNavButtonState();
}

class _HeaderNavButtonState extends State<_HeaderNavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isActiveOrHovered = widget.isActive || _isHovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            gradient: isActiveOrHovered ? AppColors.primaryGradient : null,
            color: isActiveOrHovered ? null : Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: widget.isActive ? 2 : 1,
              color: widget.isActive
                  ? AppColors.accentCyan
                  : (_isHovered
                        ? AppColors.accentCyan.withOpacity(0.5)
                        : Colors.white.withOpacity(0.1)),
            ),
            boxShadow: widget.isActive
                ? [
                    BoxShadow(
                      color: AppColors.accentCyan.withOpacity(0.4),
                      blurRadius: 12,
                      spreadRadius: 1,
                    ),
                  ]
                : null,
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 15,
              fontWeight: isActiveOrHovered ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
