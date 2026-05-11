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
      height: Responsive.height(context),
      color: AppColors.bgDark,
      child: Stack(
        children: [
          // Subtle dot-grid background
          Positioned.fill(
            child: CustomPaint(painter: _DotGridPainter()),
          ),

          // Soft radial glow from top-center
          Positioned(
            top: -180,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 700,
                height: 700,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.accent.withValues(alpha: 0.07),
                      Colors.transparent,
                    ],
                  ),
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
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.spacing(context, 40),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  // Code-tag label
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withValues(alpha: 0.06),
                      border: Border.all(
                        color: AppColors.accent.withValues(alpha: 0.30),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '< Mobile Developer />',
                      style: TextStyle(
                        fontFamily: 'monospace',
                        color: AppColors.accent,
                        fontSize: 12,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Name with gradient
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
                          isMobile ? 36 : 62,
                        ),
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                        letterSpacing: isMobile ? -1 : -2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Animated typing subtitle
                  SizedBox(
                    height: 36,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: Responsive.fontSize(context, 17),
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.3,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: PortfolioData.typingTexts.map((text) {
                          return TypewriterAnimatedText(
                            text,
                            speed: const Duration(milliseconds: 80),
                          );
                        }).toList(),
                        repeatForever: true,
                        pause: const Duration(milliseconds: 1600),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Short bio
                  Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Text(
                      "Fresh Graduate passionate about creating beautiful and functional mobile applications with Flutter and Kotlin",
                      style: TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: Responsive.fontSize(context, 15),
                        height: 1.75,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 48),

                  // CTA Buttons
                  Wrap(
                    spacing: 14,
                    runSpacing: 14,
                    alignment: WrapAlignment.center,
                    children: [
                      CustomButton(
                        text: "View Projects",
                        onPressed: onProjectsPressed,
                        isPrimary: true,
                        icon: Icons.arrow_forward_rounded,
                      ),
                      CustomButton(
                        text: "Contact Me",
                        onPressed: onContactPressed,
                        isPrimary: false,
                        icon: Icons.mail_outline_rounded,
                      ),
                    ],
                  ),

                  const SizedBox(height: 72),

                  // Scroll indicator
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: onScrollDown,
                      child: Column(
                        children: [
                          Text(
                            'SCROLL',
                            style: TextStyle(
                              color: AppColors.textTertiary,
                              fontSize: 10,
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _BouncingArrow(),
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

class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.032)
      ..strokeCap = StrokeCap.round;
    const spacing = 38.0;
    for (double x = spacing; x < size.width; x += spacing) {
      for (double y = spacing; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotGridPainter old) => false;
}

class _BouncingArrow extends StatefulWidget {
  @override
  State<_BouncingArrow> createState() => _BouncingArrowState();
}

class _BouncingArrowState extends State<_BouncingArrow>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _anim = Tween<double>(begin: 0, end: 7).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, child) => Transform.translate(
        offset: Offset(0, _anim.value),
        child: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.accent.withValues(alpha: 0.6),
          size: 24,
        ),
      ),
    );
  }
}
