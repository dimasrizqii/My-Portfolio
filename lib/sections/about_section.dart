import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/responsive.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

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
                title: "About Me",
                subtitle: "Who I Am",
              ),

              const SizedBox(height: 64),

              isMobile
                  ? _buildMobileLayout(context)
                  : _buildDesktopLayout(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildBio(context),
        const SizedBox(height: 40),
        _buildStatCards(context),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: _buildBio(context)),
        const SizedBox(width: 64),
        Expanded(flex: 2, child: _buildStatCards(context)),
      ],
    );
  }

  Widget _buildBio(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          PortfolioData.bio,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: Responsive.fontSize(context, 15),
            height: 1.85,
          ),
        ),

        const SizedBox(height: 36),

        _buildInfoRow(
          icon: Icons.school_outlined,
          label: "Education",
          value: PortfolioData.education,
        ),
        const SizedBox(height: 20),
        _buildInfoRow(
          icon: Icons.location_on_outlined,
          label: "Location",
          value: PortfolioData.location,
        ),
        const SizedBox(height: 20),
        _buildInfoRow(
          icon: Icons.work_outline,
          label: "Status",
          value: PortfolioData.status,
        ),
      ],
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.accent, size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label.toUpperCase(),
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCards(BuildContext context) {
    return Column(
      children: [
        _StatCard(
          value: "${PortfolioData.projectsCount}+",
          label: "Projects",
          icon: Icons.code_rounded,
          accentColor: AppColors.accent,
        ),
        const SizedBox(height: 16),
        _StatCard(
          value: "${PortfolioData.skillsCount}+",
          label: "Technologies",
          icon: Icons.auto_awesome_rounded,
          accentColor: AppColors.accentLight,
        ),
        const SizedBox(height: 16),
        _StatCard(
          value: "IT Facilitator",
          label: "Current Role",
          icon: Icons.person_outline_rounded,
          accentColor: AppColors.accentPink,
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color accentColor;

  const _StatCard({
    required this.value,
    required this.label,
    required this.icon,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: accentColor, size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: AppColors.textBright,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
