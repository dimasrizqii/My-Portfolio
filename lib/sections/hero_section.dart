import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../utils/app_colors.dart';
import '../utils/responsive.dart';
import '../data/portfolio_data.dart';
import '../widgets/custom_button.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactPressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onScrollDown;

  const HeroSection({
    super.key,
    required this.onContactPressed,
    required this.onProjectsPressed,
    required this.onScrollDown,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      // Exact height = full viewport
      height: Responsive.height(context),
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
      child: Stack(
        children: [
          // Animated background circles
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.accentCyan.withOpacity(0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            left: -150,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.accentPurple.withOpacity(0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Content
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: Responsive.getMaxWidth(context),
              ),
              padding: EdgeInsets.only(
                left: Responsive.spacing(context, 40),
                right: Responsive.spacing(context, 40),
                top: 100, // Space for header
                bottom: 60,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  // Greeting with Icon instead of emoji
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hello guys",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: Responsive.fontSize(context, 24),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.auto_awesome,
                        color: AppColors.accentCyan,
                        size: Responsive.fontSize(context, 24),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        ", My name is",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: Responsive.fontSize(context, 24),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Name with Gradient
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        AppColors.primaryGradient.createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                    child: Text(
                      PortfolioData.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive.fontSize(
                          context,
                          isMobile ? 36 : 56,
                        ),
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Animated Typing Text
                  SizedBox(
                    height: 60,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: AppColors.accentCyan,
                        fontSize: Responsive.fontSize(context, 24),
                        fontWeight: FontWeight.w600,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: PortfolioData.typingTexts.map((text) {
                          return TypewriterAnimatedText(
                            text,
                            speed: const Duration(milliseconds: 100),
                          );
                        }).toList(),
                        repeatForever: true,
                        pause: const Duration(milliseconds: 1000),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Short Bio
                  Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Text(
                      "Fresh Graduate passionate about creating beautiful and functional mobile applications with Flutter and Kotlin",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: Responsive.fontSize(context, 16),
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 48),

                  // CTA Buttons
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      CustomButton(
                        text: "View Projects",
                        onPressed: onProjectsPressed,
                        isPrimary: true,
                        icon: Icons.rocket_launch,
                      ),
                      CustomButton(
                        text: "Contact Me",
                        onPressed: onContactPressed,
                        isPrimary: false,
                        icon: Icons.email_outlined,
                      ),
                    ],
                  ),

                  const SizedBox(height: 80),

                  // Clickable Scroll Indicator
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: onScrollDown,
                      child: Column(
                        children: [
                          const Text(
                            "Scroll to explore",
                            style: TextStyle(
                              color: AppColors.textTertiary,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0, end: 10),
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeInOut,
                            builder: (context, double value, child) {
                              return Transform.translate(
                                offset: Offset(0, value),
                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.accentCyan,
                                  size: 32,
                                ),
                              );
                            },
                            onEnd: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
