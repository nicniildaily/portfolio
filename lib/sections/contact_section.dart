import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import '../widgets/section_header.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              const SectionHeader(title: "Let's Connect"),
              if (isMobile)
                Column(children: [_ContactInfo(), const SizedBox(height: 40), _ContactForm()])
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(child: _ContactInfo()),
                    const SizedBox(width: 60),
                    const Expanded(child: _ContactForm()),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get in touch',
          style: AppText.inter(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 16),
        _ContactRow(icon: Icons.email_outlined, text: 'abigaelkwairimu@gmail.com'),
        const SizedBox(height: 12),
        _ContactRow(icon: Icons.phone_outlined, text: '+254 729 103 623'),
        const SizedBox(height: 12),
        _ContactRow(icon: Icons.link, text: 'linkedin.com/in/abigaelkamau'),
        const SizedBox(height: 12),
        _ContactRow(icon: Icons.code, text: 'github.com/nicniildaily'),
        const SizedBox(height: 32),
        Text(
          'Available for freelance projects, collaborations, and full-time opportunities.',
          style: AppText.inter(fontSize: 14, color: AppColors.textSecondary, height: 1.6),
        ),
      ],
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: AppText.inter(fontSize: 15, color: AppColors.textPrimary),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _ContactForm extends StatelessWidget {
  const _ContactForm();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send a message',
            style: AppText.inter(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 16),
          TextField(decoration: _inputDecoration('Name')),
          const SizedBox(height: 12),
          TextField(decoration: _inputDecoration('Email'), keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 12),
          TextField(decoration: _inputDecoration('Message'), maxLines: 4),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {}, child: const Text('Send Message')),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: AppText.inter(fontSize: 14, color: AppColors.textSecondary),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.textSecondary.withValues(alpha: 0.3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.textSecondary.withValues(alpha: 0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }
}
