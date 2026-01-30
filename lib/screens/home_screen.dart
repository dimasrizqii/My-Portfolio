import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';
import '../sections/projects_section.dart';
import '../sections/contact_section.dart';
import '../widgets/header_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  String _activeSection = 'Home';
  bool _showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final scrollPosition = _scrollController.position.pixels;
    final aboutPosition = _getPosition(_aboutKey);
    final skillsPosition = _getPosition(_skillsKey);
    final projectsPosition = _getPosition(_projectsKey);
    final contactPosition = _getPosition(_contactKey);

    String newSection = 'Home';

    if (scrollPosition >= contactPosition - 200) {
      newSection = 'Contact';
    } else if (scrollPosition >= projectsPosition - 200) {
      newSection = 'Projects';
    } else if (scrollPosition >= skillsPosition - 200) {
      newSection = 'Skills';
    } else if (scrollPosition >= aboutPosition - 200) {
      newSection = 'About';
    }

    // Show scroll-to-top button when scrolled past hero section
    final shouldShowButton = scrollPosition > 400;

    if (newSection != _activeSection || shouldShowButton != _showScrollToTop) {
      setState(() {
        _activeSection = newSection;
        _showScrollToTop = shouldShowButton;
      });
    }
  }

  double _getPosition(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return 0;
    final position = renderBox.localToGlobal(Offset.zero);
    return position.dy + _scrollController.position.pixels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: Stack(
        children: [
          // Main Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Hero Section
                Container(
                  key: _heroKey,
                  child: HeroSection(
                    onContactPressed: () => _scrollToSection(_contactKey),
                    onProjectsPressed: () => _scrollToSection(_projectsKey),
                    onScrollDown: () => _scrollToSection(_aboutKey),
                  ),
                ),

                // About Section
                Container(key: _aboutKey, child: const AboutSection()),

                // Skills Section
                Container(key: _skillsKey, child: const SkillsSection()),

                // Projects Section
                Container(key: _projectsKey, child: const ProjectsSection()),

                // Contact Section
                Container(key: _contactKey, child: const ContactSection()),
              ],
            ),
          ),

          // Always-visible Header with Active State
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HeaderBar(
              activeSection: _activeSection,
              onHomeTap: () {
                setState(() => _activeSection = 'Home');
                _scrollToSection(_heroKey);
              },
              onAboutTap: () {
                setState(() => _activeSection = 'About');
                _scrollToSection(_aboutKey);
              },
              onSkillsTap: () {
                setState(() => _activeSection = 'Skills');
                _scrollToSection(_skillsKey);
              },
              onProjectsTap: () {
                setState(() => _activeSection = 'Projects');
                _scrollToSection(_projectsKey);
              },
              onContactTap: () {
                setState(() => _activeSection = 'Contact');
                _scrollToSection(_contactKey);
              },
            ),
          ),

          // Scroll to Previous/Top Button (shows when scrolled down)
          if (_showScrollToTop)
            Positioned(
              bottom: 100, // Upper position
              right: 32,
              child: AnimatedOpacity(
                opacity: _showScrollToTop ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: _ScrollToTopButton(
                  onTap: () {
                    // Smart navigation: go to previous section
                    if (_activeSection == 'Skills') {
                      _scrollToSection(_aboutKey); // Skills → About
                    } else if (_activeSection == 'Projects') {
                      _scrollToSection(_skillsKey); // Projects → Skills
                    } else if (_activeSection == 'Contact') {
                      _scrollToSection(_projectsKey); // Contact → Projects
                    } else {
                      // About or Home → scroll to top
                      _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ),
            ),

          // Scroll to Next Section Button (shows in About, Skills, Projects)
          if (_activeSection == 'About' ||
              _activeSection == 'Skills' ||
              _activeSection == 'Projects')
            Positioned(
              bottom: 32, // Lower position (below up button)
              right: 32,
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 300),
                child: _ScrollToNextButton(
                  onTap: () {
                    // Determine next section based on current
                    GlobalKey nextKey;
                    if (_activeSection == 'About') {
                      nextKey = _skillsKey;
                    } else if (_activeSection == 'Skills') {
                      nextKey = _projectsKey;
                    } else {
                      nextKey = _contactKey; // Projects → Contact
                    }
                    _scrollToSection(nextKey);
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        alignment: 0.0, // Scroll to top of section
      );
    }
  }
}

class _ScrollToTopButton extends StatefulWidget {
  final VoidCallback onTap;

  const _ScrollToTopButton({required this.onTap});

  @override
  State<_ScrollToTopButton> createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<_ScrollToTopButton> {
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
          duration: const Duration(milliseconds: 200),
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            gradient: _isHovered
                ? AppColors.primaryGradient
                : LinearGradient(
                    colors: [
                      AppColors.accentCyan.withOpacity(0.8),
                      AppColors.accentPurple.withOpacity(0.8),
                    ],
                  ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.accentCyan.withOpacity(0.5)
                    : AppColors.accentCyan.withOpacity(0.3),
                blurRadius: _isHovered ? 20 : 15,
                spreadRadius: _isHovered ? 3 : 2,
              ),
            ],
          ),
          child: Icon(
            Icons.keyboard_arrow_up,
            color: AppColors.textPrimary,
            size: _isHovered ? 32 : 28,
          ),
        ),
      ),
    );
  }
}

class _ScrollToNextButton extends StatefulWidget {
  final VoidCallback onTap;

  const _ScrollToNextButton({required this.onTap});

  @override
  State<_ScrollToNextButton> createState() => _ScrollToNextButtonState();
}

class _ScrollToNextButtonState extends State<_ScrollToNextButton> {
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
          duration: const Duration(milliseconds: 200),
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            gradient: _isHovered
                ? AppColors.primaryGradient
                : LinearGradient(
                    colors: [
                      AppColors.accentPurple.withOpacity(0.8),
                      AppColors.accentCyan.withOpacity(0.8),
                    ],
                  ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.accentPurple.withOpacity(0.5)
                    : AppColors.accentPurple.withOpacity(0.3),
                blurRadius: _isHovered ? 20 : 15,
                spreadRadius: _isHovered ? 3 : 2,
              ),
            ],
          ),
          child: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textPrimary,
            size: _isHovered ? 32 : 28,
          ),
        ),
      ),
    );
  }
}
