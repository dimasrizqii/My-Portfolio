import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final String? url;
  final bool isPrimary;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.url,
    this.isPrimary = true,
    this.icon,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  Future<void> _handlePress() async {
    if (widget.url != null) {
      final uri = Uri.parse(widget.url!);
      try {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } catch (e) {
        await launchUrl(uri, webOnlyWindowName: '_blank');
      }
    } else if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: _handlePress,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            decoration: BoxDecoration(
              gradient: widget.isPrimary ? AppColors.primaryGradient : null,
              color: widget.isPrimary ? null : AppColors.bgCard,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 2,
                color: _isHovered
                    ? AppColors.accentCyan
                    : Colors.white.withOpacity(0.1),
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: widget.isPrimary
                            ? AppColors.accentCyan.withOpacity(0.5)
                            : AppColors.accentPurple.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null) ...[
                  Icon(widget.icon, color: AppColors.textPrimary, size: 20),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.text,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
