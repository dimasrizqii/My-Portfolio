import 'dart:ui';
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

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.spacing(context, 40),
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: AppColors.bgDark.withValues(alpha: 0.80),
            border: Border(
              bottom: BorderSide(color: AppColors.border, width: 1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              GestureDetector(
                onTap: onHomeTap,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Monogram badge
                      Container(
                        width: isMobile ? 30 : 34,
                        height: isMobile ? 30 : 34,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'DR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isMobile ? 11 : 12,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      if (!isMobile) ...[
                        const SizedBox(width: 10),
                        Text(
                          'Dimas Rizqi',
                          style: TextStyle(
                            color: AppColors.textBright,
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              // Navigation links (hidden on mobile)
              if (!isMobile)
                Row(
                  children: [
                    _NavLink(
                      label: 'Home',
                      onTap: onHomeTap,
                      isActive: activeSection == 'Home',
                    ),
                    const SizedBox(width: 36),
                    _NavLink(
                      label: 'About',
                      onTap: onAboutTap,
                      isActive: activeSection == 'About',
                    ),
                    const SizedBox(width: 36),
                    _NavLink(
                      label: 'Skills',
                      onTap: onSkillsTap,
                      isActive: activeSection == 'Skills',
                    ),
                    const SizedBox(width: 36),
                    _NavLink(
                      label: 'Projects',
                      onTap: onProjectsTap,
                      isActive: activeSection == 'Projects',
                    ),
                    const SizedBox(width: 36),
                    _NavLink(
                      label: 'Contact',
                      onTap: onContactTap,
                      isActive: activeSection == 'Contact',
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const _NavLink({
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color textColor = widget.isActive
        ? AppColors.accent
        : (_isHovered ? AppColors.textBright : AppColors.textPrimary);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: widget.isActive ? AppColors.accent : Colors.transparent,
                width: 1.5,
              ),
            ),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: widget.isActive ? FontWeight.w500 : FontWeight.w400,
              letterSpacing: 0.1,
            ),
          ),
        ),
      ),
    );
  }
}
