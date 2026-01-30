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
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _showFloatingNav = false;

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
    if (_scrollController.offset > 300 && !_showFloatingNav) {
      setState(() => _showFloatingNav = true);
    } else if (_scrollController.offset <= 300 && _showFloatingNav) {
      setState(() => _showFloatingNav = false);
    }
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
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
                HeroSection(
                  onContactPressed: () => _scrollToSection(_contactKey),
                  onProjectsPressed: () => _scrollToSection(_projectsKey),
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

          // Fixed Header (shows at top, hides when scrolled)
          if (!_showFloatingNav)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: !_showFloatingNav ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: _HeaderBar(
                  onAboutTap: () => _scrollToSection(_aboutKey),
                  onSkillsTap: () => _scrollToSection(_skillsKey),
                  onProjectsTap: () => _scrollToSection(_projectsKey),
                  onContactTap: () => _scrollToSection(_contactKey),
                  onHomeTap: () {
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),

          // Floating Hamburger Menu
          if (_showFloatingNav)
            Positioned(
              top: 20,
              right: 20,
              child: AnimatedOpacity(
                opacity: _showFloatingNav ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: _HamburgerButton(
                  onAboutTap: () => _scrollToSection(_aboutKey),
                  onSkillsTap: () => _scrollToSection(_skillsKey),
                  onProjectsTap: () => _scrollToSection(_projectsKey),
                  onContactTap: () => _scrollToSection(_contactKey),
                  onHomeTap: () {
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _HeaderBar extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const _HeaderBar({
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return HeaderBar(
      onHomeTap: onHomeTap,
      onAboutTap: onAboutTap,
      onSkillsTap: onSkillsTap,
      onProjectsTap: onProjectsTap,
      onContactTap: onContactTap,
    );
  }
}

class _HamburgerButton extends StatefulWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const _HamburgerButton({
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  State<_HamburgerButton> createState() => _HamburgerButtonState();
}

class _HamburgerButtonState extends State<_HamburgerButton>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void _handleMenuTap(VoidCallback callback) {
    callback();
    _toggleMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Menu Items (appear when open)
        if (_isOpen) ...[
          _MenuItem(
            label: "Home",
            icon: Icons.home_outlined,
            onTap: () => _handleMenuTap(widget.onHomeTap),
          ),
          const SizedBox(height: 12),
          _MenuItem(
            label: "About",
            icon: Icons.person_outline,
            onTap: () => _handleMenuTap(widget.onAboutTap),
          ),
          const SizedBox(height: 12),
          _MenuItem(
            label: "Skills",
            icon: Icons.code,
            onTap: () => _handleMenuTap(widget.onSkillsTap),
          ),
          const SizedBox(height: 12),
          _MenuItem(
            label: "Projects",
            icon: Icons.work_outline,
            onTap: () => _handleMenuTap(widget.onProjectsTap),
          ),
          const SizedBox(height: 12),
          _MenuItem(
            label: "Contact",
            icon: Icons.email_outlined,
            onTap: () => _handleMenuTap(widget.onContactTap),
          ),
          const SizedBox(height: 16),
        ],

        // Hamburger Button
        GestureDetector(
          onTap: _toggleMenu,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentCyan.withOpacity(0.4),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: RotationTransition(
              turns: _rotationAnimation,
              child: Icon(
                _isOpen ? Icons.close : Icons.menu,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MenuItem extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _MenuItem({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            gradient: _isHovered ? AppColors.primaryGradient : null,
            color: _isHovered ? null : AppColors.bgCard.withOpacity(0.95),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 2,
              color: _isHovered
                  ? Colors.transparent
                  : Colors.white.withOpacity(0.1),
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.accentCyan.withOpacity(0.3)
                    : Colors.black.withOpacity(0.2),
                blurRadius: _isHovered ? 15 : 10,
                spreadRadius: _isHovered ? 1 : 0,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: AppColors.textPrimary, size: 20),
              const SizedBox(width: 12),
              Text(
                widget.label,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 15,
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
