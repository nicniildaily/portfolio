import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../theme/app_colors.dart';
import '../widgets/section_header.dart';

class _GalleryItem {
  final String imageSeed;
  final String? imageAsset;
  final double aspectRatio;
  final String label;

  const _GalleryItem({required this.imageSeed, this.imageAsset, required this.aspectRatio, required this.label});
}

const List<_GalleryItem> _galleryItems = [
  _GalleryItem(
    imageSeed: 'velmique',
    imageAsset: 'assets/logos/velmique.png',
    aspectRatio: 1,
    label: 'Velmique Beauty',
  ),
  //_GalleryItem(imageSeed: 'ui1', aspectRatio: 0.8, label: 'UI Screen'),
  _GalleryItem(imageSeed: 'pelinotes', imageAsset: 'assets/logos/pelinotes.png', aspectRatio: 1, label: 'Pelinotes'),
  _GalleryItem(imageSeed: 'budgibuddy', imageAsset: 'assets/logos/budgibuddy.png', aspectRatio: 1, label: 'Budgibuddy'),
  /*  _GalleryItem(imageSeed: 'wireframe1', aspectRatio: 1.2, label: 'Wireframe'),
  _GalleryItem(imageSeed: 'ui2', aspectRatio: 0.7, label: 'Mobile UI'), */
  _GalleryItem(imageSeed: 'mawemaji', imageAsset: 'assets/logos/mawemaji.png', aspectRatio: 1, label: 'Mawemaji'),
  /* _GalleryItem(imageSeed: 'website1', aspectRatio: 1.6, label: 'Website Design'),
  _GalleryItem(imageSeed: 'prototype1', aspectRatio: 1.3, label: 'Prototype'), */
];

class DesignGallery extends StatelessWidget {
  const DesignGallery({super.key});

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
              const SectionHeader(title: 'Design Gallery'),
              MasonryGridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: isMobile ? 2 : 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                itemCount: _galleryItems.length,
                itemBuilder: (context, index) {
                  final item = _galleryItems[index];
                  return _GalleryTile(item: item);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GalleryTile extends StatelessWidget {
  final _GalleryItem item;

  const _GalleryTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPreview(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 2)),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AspectRatio(
            aspectRatio: item.aspectRatio,
            child: item.imageAsset != null
                ? Container(
                    color: AppColors.surface,
                    padding: const EdgeInsets.all(24),
                    child: Image.asset(item.imageAsset!, fit: BoxFit.contain),
                  )
                : CachedNetworkImage(
                    imageUrl: 'https://picsum.photos/seed/${item.imageSeed}/400/${(400 / item.aspectRatio).round()}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: AppColors.surface,
                      child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.surface,
                      child: Icon(Icons.image, color: AppColors.textSecondary),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void _showPreview(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(24),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: item.imageAsset != null
                ? Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(48),
                    child: Image.asset(item.imageAsset!, fit: BoxFit.contain),
                  )
                : CachedNetworkImage(
                    imageUrl: 'https://picsum.photos/seed/${item.imageSeed}/800/1000',
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Container(
                      color: Colors.black26,
                      child: const Center(child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.black26,
                      child: const Icon(Icons.image, color: Colors.white54),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
