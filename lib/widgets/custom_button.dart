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
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 180),
        child: GestureDetector(
          onTap: _handlePress,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            decoration: BoxDecoration(
              color: widget.isPrimary
                  ? (_isHovered ? AppColors.accentLight : AppColors.accent)
                  : Colors.white.withValues(alpha: _isHovered ? 0.09 : 0.05),
              borderRadius: BorderRadius.circular(8),
              border: widget.isPrimary
                  ? null
                  : Border.all(
                      color: Colors.white.withValues(
                        alpha: _isHovered ? 0.18 : 0.10,
                      ),
                      width: 1,
                    ),
              boxShadow: widget.isPrimary && _isHovered
                  ? [
                      BoxShadow(
                        color: AppColors.accent.withValues(alpha: 0.40),
                        blurRadius: 22,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    color: AppColors.textBright,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1,
                  ),
                ),
                if (widget.icon != null) ...[
                  const SizedBox(width: 8),
                  Icon(widget.icon, color: AppColors.textBright, size: 17),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
