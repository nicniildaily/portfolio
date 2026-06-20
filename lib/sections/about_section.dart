import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import '../widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              const SectionHeader(title: 'About Me'),
              Container(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Column(
                  children: [
                    _paragraph(
                      context,
                      'One year ago, I started learning Flutter with a simple goal: to turn ideas into real products. Since then, I have taught myself mobile development, web development, UI/UX design, branding, and product creation. Through projects such as Velmique Beauty, I have learned not only how to write code but also how to design experiences, build brands, and bring products to life.',
                    ),
                    const SizedBox(height: 20),
                    _paragraph(
                      context,
                      'My interest in development came from a desire to create solutions rather than simply consume technology. I wanted to understand how the applications and websites I used every day were built and to gain the ability to turn my own ideas into working products. The idea of being able to design, develop, and launch something from scratch motivated me to start learning programming and application development.',
                    ),
                    const SizedBox(height: 20),
                    _paragraph(
                      context,
                      'I followed a self-directed learning path using online tutorials, documentation, videos, articles, and practical projects. Instead of focusing only on theory, I learned by building real applications and solving problems as they arose. Each project taught me something new, whether it was user interface design, state management, API integration, responsive layouts, deployment, or debugging. Consistent practice and curiosity became my greatest learning tools.',
                    ),
                    const SizedBox(height: 20),
                    _paragraph(
                      context,
                      'Throughout my journey, I have built projects including a beauty marketplace (Velmique Beauty), a digital notebook (Pelinotes), an expense tracker (Budgibuddy), an environmental solution (Mawemaji), and various websites and design projects. These experiences have given me a complete product development skillset from idea generation and design to development and deployment.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paragraph(BuildContext context, String text) {
    return Text(
      text,
      style: AppText.inter(
        fontSize: 16,
        color: AppColors.textPrimary,
        height: 1.8,
      ),
    );
  }
}
