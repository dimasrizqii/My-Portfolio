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
          constraints: BoxConstraints(
            maxWidth: Responsive.getMaxWidth(context),
          ),
          child: Column(
            children: [
              const SectionTitle(
                title: "About Me",
                subtitle: "Get to know me better",
              ),

              const SizedBox(height: 60),

              // Content
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
        _buildInfoCards(context),
        const SizedBox(height: 40),
        _buildBio(context),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: _buildBio(context)),
        const SizedBox(width: 60),
        Expanded(flex: 1, child: _buildInfoCards(context)),
      ],
    );
  }

  Widget _buildBio(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Hello! ",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: Responsive.fontSize(context, 28),
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.waving_hand,
              color: AppColors.accentCyan,
              size: Responsive.fontSize(context, 28),
            ),
          ],
        ),

        const SizedBox(height: 20),

        Text(
          PortfolioData.bio,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: Responsive.fontSize(context, 16),
            height: 1.8,
          ),
        ),

        const SizedBox(height: 24),

        _buildInfoItem(
          context,
          icon: Icons.school_outlined,
          title: "Education",
          value: PortfolioData.education,
        ),

        const SizedBox(height: 16),

        _buildInfoItem(
          context,
          icon: Icons.location_on_outlined,
          title: "Location",
          value: PortfolioData.location,
        ),

        const SizedBox(height: 16),

        _buildInfoItem(
          context,
          icon: Icons.work_outline,
          title: "Status",
          value: PortfolioData.status,
        ),
      ],
    );
  }

  Widget _buildInfoItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCards(BuildContext context) {
    return Column(
      children: [
        _buildStatCard(
          context,
          icon: Icons.code,
          value: "${PortfolioData.projectsCount}+",
          label: "Projects",
          gradient: LinearGradient(
            colors: [
              AppColors.accentCyan.withOpacity(0.2),
              AppColors.accentCyan.withOpacity(0.05),
            ],
          ),
          iconColor: AppColors.accentCyan,
        ),

        const SizedBox(height: 20),

        _buildStatCard(
          context,
          icon: Icons.stars,
          value: "${PortfolioData.skillsCount}+",
          label: "Skills",
          gradient: LinearGradient(
            colors: [
              AppColors.accentPurple.withOpacity(0.2),
              AppColors.accentPurple.withOpacity(0.05),
            ],
          ),
          iconColor: AppColors.accentPurple,
        ),

        const SizedBox(height: 20),

        _buildStatCard(
          context,
          icon: Icons.emoji_events,
          value: PortfolioData.experience,
          label: "Experience",
          gradient: LinearGradient(
            colors: [
              AppColors.accentPink.withOpacity(0.2),
              AppColors.accentPink.withOpacity(0.05),
            ],
          ),
          iconColor: AppColors.accentPink,
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String value,
    required String label,
    required Gradient gradient,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 2, color: iconColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 32),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
