import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PortfolioData {
  // Personal Info
  static const String name = "Dimas Rizqi Ibadurrahim";
  static const String shortName = "Dimas";
  static const String title = "Mobile App Developer";
  static const String subtitle = "Flutter & Kotlin Enthusiast";

  static const String bio =
      "Fresh Graduate from Universitas Pembangunan Nasional \"Veteran\" Jawa Timur. "
      "Passionate about creating beautiful and functional mobile applications with Flutter and Kotlin. "
      "Always eager to learn new technologies and contribute to meaningful projects.";

  static const String location = "Surabaya, Indonesia";
  static const String education = "UPN Veteran Jawa Timur";
  static const String status = "Actively looking for opportunities";

  // Contact Info
  static const String email = "dimas7rizqi@gmail.com"; // Update with real email
  static const String github = "https://github.com/dimasrizqii";
  static const String linkedin =
      "https://linkedin.com/in/dimasrizqii"; // Update if available

  // Quick Stats
  static const int projectsCount = 36;
  static const int skillsCount = 15;
  static const String experience = "Fresh Graduate";

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
    // Frontend
    Skill(
      name: "HTML/CSS",
      icon: FontAwesomeIcons.paintbrush,
      category: "Frontend",
    ),
    Skill(name: "JavaScript", icon: FontAwesomeIcons.js, category: "Frontend"),
    // Tools & Others
    Skill(name: "Git", icon: FontAwesomeIcons.gitAlt, category: "Tools"),
    Skill(name: "GitHub", icon: FontAwesomeIcons.github, category: "Tools"),
    Skill(name: "Postman", icon: FontAwesomeIcons.rocket, category: "Tools"),
    Skill(name: "Firebase", icon: FontAwesomeIcons.fire, category: "Backend"),
    Skill(name: "REST API", icon: FontAwesomeIcons.server, category: "Backend"),
    // Soft Skills
    Skill(
      name: "UI Implementation",
      icon: FontAwesomeIcons.palette,
      category: "Design",
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
      name: "Flutter Portfolio",
      description:
          "Personal portfolio website built with Flutter showcasing my projects and skills",
      technologies: ["Flutter", "Dart", "Web"],
      githubUrl:
          "https://github.com/dimasrizqii/flutter_dimas-rizqi-ibadurrahim",
    ),
    Project(
      name: "Currency Converter",
      description:
          "Web-based currency converter application with real-time exchange rates",
      technologies: ["HTML", "CSS", "JavaScript"],
      githubUrl:
          "https://github.com/dimasrizqii/Sistem-Konverter-Nilai-Mata-Uang",
    ),
    Project(
      name: "Android Intent Demo",
      description:
          "Learning project demonstrating Android Intent mechanisms and navigation",
      technologies: ["Kotlin", "Android"],
      githubUrl: "https://github.com/dimasrizqii/belajarIntent",
    ),
    Project(
      name: "Navigation Component",
      description: "Android app showcasing Navigation Component implementation",
      technologies: ["Kotlin", "Android", "Navigation"],
      githubUrl: "https://github.com/dimasrizqii/CobaNavigationComponent",
    ),
    Project(
      name: "Challenge Chapter 1",
      description: "Kotlin programming challenges and exercises",
      technologies: ["Kotlin"],
      githubUrl: "https://github.com/dimasrizqii/challengeChapter1",
    ),
    Project(
      name: "Challenge Chapter 2",
      description: "Advanced Kotlin challenges focusing on Android development",
      technologies: ["Kotlin", "Android"],
      githubUrl: "https://github.com/dimasrizqii/challengeChapter2",
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
      name: "Email",
      url: "mailto:dimas7rizqi@gmail.com",
      icon: FontAwesomeIcons.envelope,
    ),
    SocialLink(
      name: "WhatsApp",
      url: "https://wa.me/6281803613134", // Update with real number
      icon: FontAwesomeIcons.whatsapp,
    ),
  ];
}
