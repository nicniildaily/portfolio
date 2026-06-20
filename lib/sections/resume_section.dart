import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';

class ResumeSection extends StatelessWidget {
  final VoidCallback onDownloadResume;

  const ResumeSection({super.key, required this.onDownloadResume});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            children: [
              Text(
                'Interested in Working Together?',
                style: AppText.playfairDisplay(
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Download my resume to learn more about my experience, projects and skills.',
                style: AppText.inter(fontSize: 16, color: AppColors.textSecondary, height: 1.6),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 56,
                child:                 ElevatedButton.icon(
                  onPressed: onDownloadResume,
                  icon: const Icon(Icons.download, size: 20),
                  label: const Text('Download Resume'),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 32)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
