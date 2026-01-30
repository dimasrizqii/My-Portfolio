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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.bgDark, AppColors.bgCard.withOpacity(0.5)],
        ),
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: Responsive.getMaxWidth(context),
          ),
          child: Column(
            children: [
              const SectionTitle(
                title: "Let's Connect!",
                subtitle: "Feel free to reach out",
              ),

              const SizedBox(height: 60),

              // Contact Message
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: AppColors.cardGradient,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 2,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "I'm actively looking for opportunities as a Mobile Developer",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: Responsive.fontSize(context, 20),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 16),

                    Text(
                      "Whether you have a question or just want to say hi, I'll try my best to get back to you!",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: Responsive.fontSize(context, 16),
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              // Social Links
              Wrap(
                spacing: 24,
                runSpacing: 24,
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
                  Divider(color: Colors.white.withOpacity(0.1), thickness: 1),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Made with ",
                        style: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        Icons.favorite,
                        color: AppColors.accentPink,
                        size: 14,
                      ),
                      const Text(
                        " using Flutter",
                        style: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "© 2026 ${PortfolioData.name}",
                    style: TextStyle(
                      color: AppColors.textTertiary,
                      fontSize: 14,
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
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            gradient: _isHovered ? AppColors.primaryGradient : null,
            color: _isHovered ? null : AppColors.bgCard,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 2,
              color: _isHovered
                  ? Colors.transparent
                  : Colors.white.withOpacity(0.1),
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.accentCyan.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(widget.icon, color: AppColors.textPrimary, size: 24),
              const SizedBox(width: 12),
              Text(
                widget.label,
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
    );
  }
}
