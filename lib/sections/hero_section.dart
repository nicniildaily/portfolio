import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onDownloadResume;

  const HeroSection({super.key, required this.onDownloadResume});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.fromLTRB(isMobile ? 24 : 48, isMobile ? 48 : 80, isMobile ? 24 : 48, isMobile ? 48 : 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 5, child: _buildTextContent(context)),
        const SizedBox(width: 60),
        Expanded(flex: 4, child: _buildPhoto()),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildPhoto(), const SizedBox(height: 32), _buildTextContent(context)],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, I'm",
          style: AppText.inter(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 4),
        Text('Abigael Kamau', style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(height: 12),
        Text(
          'Flutter Developer, Product Builder, UI Designer and Digital Creator.',
          style: AppText.inter(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.secondary, height: 1.4),
        ),
        const SizedBox(height: 20),
        Text(
          'A passionate developer who has spent the past year learning, building and launching digital products. I transform ideas into beautiful mobile apps, websites and user experiences.',
          style: AppText.inter(fontSize: 16, color: AppColors.textSecondary, height: 1.7),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('View My Work')),
            OutlinedButton(onPressed: onDownloadResume, child: const Text('Download Resume')),
          ],
        ),
      ],
    );
  }

  Widget _buildPhoto() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 30, offset: const Offset(0, 10))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'assets/photos/photo1.png',
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
