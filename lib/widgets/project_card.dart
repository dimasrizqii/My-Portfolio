import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/portfolio_data.dart';
import '../utils/app_colors.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  Future<void> _launchUrl(String url) async {
    print('🔗 Attempting to open URL: $url');
    final uri = Uri.parse(url);
    try {
      print('🚀 Launching with platformDefault mode...');
      await launchUrl(uri, mode: LaunchMode.platformDefault);
      print('✅ URL launched successfully!');
    } catch (e) {
      print('⚠️ platformDefault failed, trying webOnlyWindowName...');
      try {
        await launchUrl(uri, webOnlyWindowName: '_blank');
        print('✅ URL launched with _blank!');
      } catch (e2) {
        print('❌ Failed to launch URL: $e2');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
        child: Container(
          height: 280,
          decoration: BoxDecoration(
            gradient: AppColors.cardGradient,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 2,
              color: _isHovered
                  ? AppColors.accentCyan.withOpacity(0.5)
                  : Colors.white.withOpacity(0.1),
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.accentCyan.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Stack(
              children: [
                // Content
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Project Name
                      Text(
                        widget.project.name,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),

                      // Description
                      Expanded(
                        child: Text(
                          widget.project.description,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                            height: 1.5,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Technologies
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.project.technologies.map((tech) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.accentCyan.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.accentCyan.withOpacity(0.3),
                              ),
                            ),
                            child: Text(
                              tech,
                              style: const TextStyle(
                                color: AppColors.accentCyan,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 16),

                      // GitHub Link
                      if (widget.project.githubUrl != null)
                        _GitHubButton(
                          url: widget.project.githubUrl!,
                          onTap: () => _launchUrl(widget.project.githubUrl!),
                        ),
                    ],
                  ),
                ),

                // Gradient Overlay on Hover (doesn't block clicks)
                if (_isHovered)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.gradientStart.withOpacity(0.1),
                              AppColors.gradientEnd.withOpacity(0.1),
                            ],
                          ),
                        ),
                      ),
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

class _GitHubButton extends StatefulWidget {
  final String url;
  final VoidCallback onTap;

  const _GitHubButton({required this.url, required this.onTap});

  @override
  State<_GitHubButton> createState() => _GitHubButtonState();
}

class _GitHubButtonState extends State<_GitHubButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          print('🖱️ GitHub button clicked!');
          widget.onTap();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: _isHovered ? AppColors.primaryGradient : null,
            color: _isHovered ? null : Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: _isHovered ? 2 : 1,
              color: _isHovered
                  ? AppColors.accentCyan
                  : Colors.white.withOpacity(0.2),
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.accentCyan.withOpacity(0.4),
                      blurRadius: 12,
                      spreadRadius: 1,
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.github,
                color: AppColors.textPrimary,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                'View on GitHub',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
