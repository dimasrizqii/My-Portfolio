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
    final heroPosition = _getPosition(_heroKey);
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

    if (newSection != _activeSection) {
      setState(() {
        _activeSection = newSection;
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
