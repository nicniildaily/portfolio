import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/project.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  void _showDemoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => _VideoPlayerDialog(assetPath: project.liveDemoAsset!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: project.imageAsset != null
                ? Container(
                    color: AppColors.surface,
                    padding: const EdgeInsets.all(32),
                    child: Image.asset(
                      project.imageAsset!,
                      fit: BoxFit.contain,
                    ),
                  )
                : CachedNetworkImage(
                    imageUrl:
                        'https://picsum.photos/seed/${project.imageSeed}/600/400',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: AppColors.surface,
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.surface,
                      child:
                          Icon(Icons.image, color: AppColors.textSecondary),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.name,
                  style: AppText.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  project.description,
                  style: AppText.inter(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: project.technologies.asMap().entries.map(
                    (entry) {
                      final idx = entry.key;
                      final tech = entry.value;
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.projectTagColors[
                                  idx % AppColors.projectTagColors.length]
                              .withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          tech,
                          style: AppText.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.projectTagColors[
                                idx % AppColors.projectTagColors.length],
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
                if (project.liveDemoAsset != null) ...[
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => _showDemoDialog(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      child: const Text('Live Demo'),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoPlayerDialog extends StatefulWidget {
  final String assetPath;
  const _VideoPlayerDialog({required this.assetPath});

  @override
  State<_VideoPlayerDialog> createState() => _VideoPlayerDialogState();
}

class _VideoPlayerDialogState extends State<_VideoPlayerDialog> {
  late VideoPlayerController _controller;
  bool _initialized = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetPath);
    _controller.initialize().then((_) {
      if (mounted) {
        setState(() => _initialized = true);
        _controller.play();
        _controller.setLooping(true);
      }
    }).catchError((_) {
      if (mounted) setState(() => _error = 'Video unavailable');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!_initialized)
              SizedBox(
                height: 200,
                child: Center(
                  child: _error != null
                      ? Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.videocam_off,
                                  size: 48, color: Colors.white54),
                              const SizedBox(height: 12),
                              Text(
                                _error!,
                                style:
                                    const TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        )
                      : const CircularProgressIndicator(),
                ),
              )
            else
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 600),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        VideoPlayer(_controller),
                        _VideoControls(controller: _controller),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
    );
  }
}

class _VideoControls extends StatelessWidget {
  final VideoPlayerController controller;
  const _VideoControls({required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.value.isPlaying) {
          controller.pause();
        } else {
          controller.play();
        }
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black54, Colors.transparent],
          ),
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}


