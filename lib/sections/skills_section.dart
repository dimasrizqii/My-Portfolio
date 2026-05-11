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
      color: AppColors.bgCard,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: Responsive.getMaxWidth(context)),
          child: Column(
            children: [
              const SectionTitle(
                title: "Skills & Technologies",
                subtitle: "What I Work With",
              ),

              const SizedBox(height: 64),

              _buildCategory(context, "Mobile", AppColors.accent),
              const SizedBox(height: 40),
              _buildCategory(context, "Frontend", AppColors.accentLight),
              const SizedBox(height: 40),
              _buildCategory(context, "Backend", AppColors.accentPink),
              const SizedBox(height: 40),
              _buildCategory(context, "Tools", AppColors.textSecondary),
              const SizedBox(height: 40),
              _buildCategory(context, "Soft Skills", AppColors.success),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(BuildContext context, String category, Color color) {
    final skills = PortfolioSkills.skills
        .where((s) => s.category == category)
        .toList();

    if (skills.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category label — small caps with leading dash
        Row(
          children: [
            Container(width: 20, height: 1, color: color),
            const SizedBox(width: 10),
            Text(
              category.toUpperCase(),
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.5,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: skills.map((skill) {
            return SkillChip(
              name: skill.name,
              icon: skill.icon as IconData,
            );
          }).toList(),
        ),
      ],
    );
  }
}
