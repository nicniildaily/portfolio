import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';

final List<String> _quickLinks = [
  'Home',
  'About',
  'Skills',
  'Projects',
  'Contact',
];

final List<IconData> _socialIcons = [
  Icons.email_outlined,
  Icons.link,
  Icons.code,
];

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: double.infinity,
      color: AppColors.textPrimary,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              if (isMobile) ...[
                _buildNameTitle(),
                const SizedBox(height: 32),
                _buildQuickLinks(),
                const SizedBox(height: 24),
                _buildSocialIcons(),
              ] else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 4, child: _buildNameTitle()),
                    Expanded(flex: 3, child: _buildQuickLinks()),
                    Expanded(flex: 3, child: _buildSocialIcons()),
                  ],
                ),
              const SizedBox(height: 32),
              Divider(color: Colors.white.withValues(alpha: 0.1)),
              const SizedBox(height: 16),
              Text(
                '\u00a9 ${DateTime.now().year} Abigael Kamau. All rights reserved.',
                style: AppText.inter(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildNameTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Abigael Kamau',
          style: AppText.playfairDisplay(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Flutter Developer & Product Builder',
          style: AppText.inter(
            fontSize: 14,
            color: Colors.white.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  static Widget _buildQuickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: AppText.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        ..._quickLinks.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              link,
              style: AppText.inter(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget _buildSocialIcons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect',
          style: AppText.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: _socialIcons
              .map(
                (icon) => Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(icon, color: Colors.white.withValues(alpha: 0.6), size: 20),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
