import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PortfolioData {
  // Personal Info
  static const String name = "Dimas Rizqi Ibadurrahim";
  static const String shortName = "Dimas";
  static const String title = "Mobile App Developer";
  static const String subtitle = "Flutter & Kotlin Enthusiast";

  static const String bio =
      "Mobile App Developer with expertise in Flutter and Kotlin/Android development. "
      "Published researcher with AI-powered educational app (GuruGPT) achieving 83.4% TAM score in JITET journal. "
      "Experienced in implementing modern architectures (Clean Architecture, MVVM, BLoC) and integrating AI technologies (OpenAI API) into mobile applications. "
      "Currently serving as IT Facilitator at PKBM ABhome, helping bridge technology and education. "
      "Fresh graduate from UPN \"Veteran\" Jawa Timur.";

  static const String location = "Surabaya, Indonesia";
  static const String education =
      "Universitas Pembangunan Nasional \"Veteran\" Jawa Timur";
  static const String status = "Open to new opportunities";

  // Contact Info
  static const String email = "dimas7rizqi@gmail.com"; // Update with real email
  static const String github = "https://github.com/dimasrizqii";
  static const String linkedin =
      "https://linkedin.com/in/dimasrizqii"; // Update if available

  // Quick Stats
  static const int projectsCount = 36;
  static const int skillsCount = 28;
  static const String experience = "IT Facilitator at PKBM ABhome";

  // Typing Animation Texts
  static const List<String> typingTexts = [
    "Mobile App Developer",
    "Flutter Enthusiast",
    "Kotlin Developer",
  ];
}

class Skill {
  final String name;
  final dynamic icon; // Can be IconData or String
  final String category;

  const Skill({required this.name, required this.icon, required this.category});
}

class PortfolioSkills {
  static const List<Skill> skills = [
    // Mobile Development
    Skill(name: "Flutter", icon: FontAwesomeIcons.code, category: "Mobile"),
    Skill(name: "Kotlin", icon: FontAwesomeIcons.laptop, category: "Mobile"),
    Skill(name: "Android", icon: FontAwesomeIcons.android, category: "Mobile"),
    // State Management
    Skill(
      name: "BLoC Pattern",
      icon: FontAwesomeIcons.cube,
      category: "State Management",
    ),
    Skill(
      name: "Provider",
      icon: FontAwesomeIcons.circleNodes,
      category: "State Management",
    ),
    // Architecture
    Skill(
      name: "Clean Architecture",
      icon: FontAwesomeIcons.diagramProject,
      category: "Architecture",
    ),
    Skill(
      name: "MVVM",
      icon: FontAwesomeIcons.sitemap,
      category: "Architecture",
    ),
    // AI Integration
    Skill(
      name: "OpenAI API",
      icon: FontAwesomeIcons.brain,
      category: "AI Integration",
    ),
    // Frontend
    Skill(name: "HTML/CSS", icon: FontAwesomeIcons.html5, category: "Frontend"),
    Skill(name: "JavaScript", icon: FontAwesomeIcons.js, category: "Frontend"),
    // Backend & Database
    Skill(name: "Firebase", icon: FontAwesomeIcons.fire, category: "Backend"),
    Skill(
      name: "Cloud Firestore",
      icon: FontAwesomeIcons.database,
      category: "Backend",
    ),
    Skill(
      name: "Firebase Auth",
      icon: FontAwesomeIcons.userShield,
      category: "Backend",
    ),
    Skill(name: "REST API", icon: FontAwesomeIcons.server, category: "Backend"),
    Skill(name: "Laravel", icon: FontAwesomeIcons.code, category: "Backend"),
    Skill(
      name: "DataStore",
      icon: FontAwesomeIcons.boxArchive,
      category: "Backend",
    ),
    // Tools & Others
    Skill(name: "Git", icon: FontAwesomeIcons.gitAlt, category: "Tools"),
    Skill(name: "GitHub", icon: FontAwesomeIcons.github, category: "Tools"),
    Skill(name: "Postman", icon: FontAwesomeIcons.rocket, category: "Tools"),
    Skill(name: "Figma", icon: FontAwesomeIcons.figma, category: "Tools"),
    Skill(name: "AI Agent", icon: FontAwesomeIcons.robot, category: "Tools"),
    Skill(
      name: "Navigation Component",
      icon: FontAwesomeIcons.route,
      category: "Tools",
    ),
    // Soft Skills
    Skill(
      name: "UI Implementation",
      icon: FontAwesomeIcons.palette,
      category: "Soft Skills",
    ),
    Skill(
      name: "Problem Solving",
      icon: FontAwesomeIcons.puzzlePiece,
      category: "Soft Skills",
    ),
    Skill(
      name: "Team Work",
      icon: FontAwesomeIcons.peopleGroup,
      category: "Soft Skills",
    ),
    Skill(
      name: "Communications",
      icon: FontAwesomeIcons.message,
      category: "Soft Skills",
    ),
  ];
}

class Project {
  final String name;
  final String description;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;

  const Project({
    required this.name,
    required this.description,
    required this.technologies,
    this.githubUrl,
    this.liveUrl,
  });
}

class PortfolioProjects {
  static const List<Project> projects = [
    Project(
      name: "GuruGPT",
      description:
          "AI-Powered Educational Discussion Topic Generator for middle school teachers using ChatGPT with Chain of Thought algorithm. Published research with 83.4% TAM score.",
      technologies: [
        "Kotlin",
        "Android",
        "OpenAI API",
        "Firebase",
        "Firestore",
      ],
      githubUrl: "https://github.com/GuruGPT/guru-gpt-mobile",
    ),
    Project(
      name: "ShopApp",
      description:
          "E-commerce mobile application with product browsing, category filtering, shopping cart, and real-time synchronization using Clean Architecture and BLoC pattern.",
      technologies: ["Flutter", "BLoC", "Firebase", "Fake Store API"],
      githubUrl:
          "https://github.com/dimasrizqii/Flutter-Learning/tree/main/Final%20Project/final_project",
    ),
    Project(
      name: "TMDB App",
      description:
          "Movie database application for browsing films, searching, and managing favorites with MVVM architecture, Google Sign-In, and infinite scroll pagination.",
      technologies: ["Flutter", "Provider", "TMDB API", "Firebase"],
      githubUrl:
          "https://github.com/dimasrizqii/mini-project-flutter_dimas-rizqi-ibadurrahim",
    ),
  ];
}

class SocialLink {
  final String name;
  final String url;
  final dynamic icon;

  const SocialLink({required this.name, required this.url, required this.icon});
}

class SocialLinks {
  static const List<SocialLink> links = [
    SocialLink(
      name: "GitHub",
      url: "https://github.com/dimasrizqii",
      icon: FontAwesomeIcons.github,
    ),
    SocialLink(
      name: "LinkedIn",
      url: "https://linkedin.com/in/dimasrizqii",
      icon: FontAwesomeIcons.linkedin,
    ),
    SocialLink(
      name: "Instagram",
      url: "https://www.instagram.com/dimasrizqii_/",
      icon: FontAwesomeIcons.instagram,
    ),
    SocialLink(
      name: "Email",
      url: "mailto:dimas7rizqi@gmail.com",
      icon: FontAwesomeIcons.envelope,
    ),
  ];
}
