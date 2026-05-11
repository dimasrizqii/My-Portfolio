import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_colors.dart';
import '../utils/responsive.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (e) {
      await launchUrl(uri, webOnlyWindowName: '_blank');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.spacing(context, 40),
        vertical: Responsive.spacing(context, 100),
      ),
      color: AppColors.bgDark,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: Responsive.getMaxWidth(context)),
          child: Column(
            children: [
              const SectionTitle(
                title: "Get In Touch",
                subtitle: "Contact",
              ),

              const SizedBox(height: 48),

              // Message card
              Container(
                constraints: const BoxConstraints(maxWidth: 560),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 36,
                ),
                decoration: BoxDecoration(
                  color: AppColors.bgCard,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border, width: 1),
                ),
                child: Column(
                  children: [
                    Text(
                      "Open to opportunities",
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "I'm actively looking for new opportunities as a Mobile Developer",
                      style: TextStyle(
                        color: AppColors.textBright,
                        fontSize: Responsive.fontSize(context, 18),
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                        letterSpacing: -0.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 14),
                    Text(
                      "Whether you have a question or just want to say hi, my inbox is always open.",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: Responsive.fontSize(context, 14),
                        height: 1.7,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 56),

              // Social links
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: SocialLinks.links.map((social) {
                  return _SocialButton(
                    icon: social.icon,
                    label: social.name,
                    onTap: () => _launchUrl(social.url),
                  );
                }).toList(),
              ),

              const SizedBox(height: 80),

              // Footer
              Column(
                children: [
                  Container(
                    height: 1,
                    color: AppColors.border,
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Built with Flutter",
                        style: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(
                        Icons.favorite_rounded,
                        color: AppColors.accent.withValues(alpha: 0.7),
                        size: 12,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "© 2026 ${PortfolioData.name}",
                    style: const TextStyle(
                      color: AppColors.textTertiary,
                      fontSize: 13,
                    ),
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

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.accent.withValues(alpha: 0.10)
                : AppColors.bgCard,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered ? AppColors.accent.withValues(alpha: 0.35) : AppColors.border,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                widget.icon,
                color: _isHovered ? AppColors.accent : AppColors.textSecondary,
                size: 16,
              ),
              const SizedBox(width: 10),
              Text(
                widget.label,
                style: TextStyle(
                  color: _isHovered ? AppColors.textPrimary : AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
