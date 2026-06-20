import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import '../widgets/section_header.dart';

class _PersonalItem {
  final String imageSeed;
  final String caption;

  const _PersonalItem({required this.imageSeed, required this.caption});
}

const List<_PersonalItem> _personalItems = [
  _PersonalItem(imageSeed: 'workspace1', caption: 'Development Setup'),
  _PersonalItem(imageSeed: 'workspace2', caption: 'Building Velmique Beauty'),
  _PersonalItem(imageSeed: 'workspace3', caption: 'UI/UX Design Session'),
  _PersonalItem(imageSeed: 'portrait1', caption: 'Professional Portrait'),
];

class PersonalGallery extends StatelessWidget {
  const PersonalGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 900;

    final crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 4);

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
              const SectionHeader(title: 'Behind The Work'),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemCount: _personalItems.length,
                itemBuilder: (context, index) {
                  final item = _personalItems[index];
                  return Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: item.imageSeed == 'portrait1'
                              ? Image.asset(
                                  'assets/photos/photo1.png',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                )
                              : CachedNetworkImage(
                                  imageUrl:
                                      'https://picsum.photos/seed/${item.imageSeed}/400/400',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  placeholder: (context, url) => Container(
                                    color: AppColors.background,
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    color: AppColors.background,
                                    child: Icon(Icons.person,
                                        color: AppColors.textSecondary),
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.caption,
                        style: AppText.inter(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
