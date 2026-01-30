import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/responsive.dart';
import '../data/portfolio_data.dart';
import '../widgets/section_title.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
          constraints: BoxConstraints(
            maxWidth: Responsive.getMaxWidth(context),
          ),
          child: Column(
            children: [
              const SectionTitle(
                title: "Featured Projects",
                subtitle: "Some of my recent work",
              ),

              const SizedBox(height: 60),

              // Projects Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = Responsive.getCrossAxisCount(context);

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: PortfolioProjects.projects.length,
                    itemBuilder: (context, index) {
                      return ProjectCard(
                        project: PortfolioProjects.projects[index],
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 60),

              // View More on GitHub
              const Text(
                "Want to see more? Check out my GitHub!",
                style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
