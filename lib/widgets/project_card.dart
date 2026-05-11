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
    final uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (e) {
      await launchUrl(uri, webOnlyWindowName: '_blank');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? AppColors.borderHover : AppColors.border,
              width: 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.35),
                      blurRadius: 32,
                      offset: const Offset(0, 12),
                    ),
                  ]
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top accent bar (appears on hover)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: _isHovered ? AppColors.primaryGradient : null,
                    color: _isHovered ? null : Colors.transparent,
                  ),
                ),

                // Card content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Folder icon + GitHub link row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.folder_outlined,
                              color: AppColors.accent,
                              size: 28,
                            ),
                            if (widget.project.githubUrl != null)
                              _IconLink(
                                icon: FontAwesomeIcons.github,
                                url: widget.project.githubUrl!,
                                onTap: () =>
                                    _launchUrl(widget.project.githubUrl!),
                              ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Project name
                        Text(
                          widget.project.name,
                          style: const TextStyle(
                            color: AppColors.textBright,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.3,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 10),

                        // Description
                        Expanded(
                          child: Text(
                            widget.project.description,
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                              height: 1.6,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Tech stack
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: widget.project.technologies.map((tech) {
                            return Text(
                              tech,
                              style: TextStyle(
                                color: AppColors.accent,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'monospace',
                                letterSpacing: 0.3,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
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

class _IconLink extends StatefulWidget {
  final IconData icon;
  final String url;
  final VoidCallback onTap;

  const _IconLink({required this.icon, required this.url, required this.onTap});

  @override
  State<_IconLink> createState() => _IconLinkState();
}

class _IconLinkState extends State<_IconLink> {
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
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.accent.withValues(alpha: 0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: FaIcon(
            widget.icon,
            color: _isHovered ? AppColors.accent : AppColors.textSecondary,
            size: 16,
          ),
        ),
      ),
    );
  }
}
