import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/responsive.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';
import '../widgets/skill_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
          colors: [
            AppColors.bgDark,
            AppColors.bgCard.withOpacity(0.3),
            AppColors.bgDark,
          ],
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
                title: "Skills & Technologies",
                subtitle: "Technologies I work with",
              ),

              const SizedBox(height: 60),

              // Skills by Category
              _buildSkillCategory(
                context,
                category: "Mobile",
                color: AppColors.accentCyan,
              ),

              const SizedBox(height: 40),

              _buildSkillCategory(
                context,
                category: "Frontend",
                color: AppColors.accentPurple,
              ),

              const SizedBox(height: 40),

              _buildSkillCategory(
                context,
                category: "Backend",
                color: AppColors.accentPink,
              ),

              const SizedBox(height: 40),

              _buildSkillCategory(
                context,
                category: "Tools",
                color: AppColors.gradientMiddle,
              ),

              const SizedBox(height: 40),

              _buildSkillCategory(
                context,
                category: "Soft Skills",
                color: AppColors.success,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context, {
    required String category,
    required Color color,
  }) {
    final skills = PortfolioSkills.skills
        .where((skill) => skill.category == category)
        .toList();

    if (skills.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Title
        Row(
          children: [
            Container(
              width: 4,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              category,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Skills
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: skills.map((skill) {
            return SkillChip(name: skill.name, icon: skill.icon as IconData);
          }).toList(),
        ),
      ],
    );
  }
}
