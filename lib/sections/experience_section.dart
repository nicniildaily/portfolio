import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/animated_counter.dart';
import '../widgets/section_header.dart';

class ExperienceSection extends StatefulWidget {
  final ScrollController scrollController;

  const ExperienceSection({
    super.key,
    required this.scrollController,
  });

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  bool _isVisible = false;
  final GlobalKey _sectionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_checkVisibility);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_checkVisibility);
    super.dispose();
  }

  void _checkVisibility() {
    final context = _sectionKey.currentContext;
    if (context == null) return;

    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final viewportHeight = MediaQuery.of(context).size.height;

    final visible =
        position.dy < viewportHeight && position.dy + renderBox.size.height > 0;

    if (visible && !_isVisible) {
      setState(() => _isVisible = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      key: _sectionKey,
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              const SectionHeader(title: "What I've Learned In One Year"),
              if (isMobile)
                _buildMobileCounters()
              else
                _buildDesktopCounters(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopCounters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AnimatedCounter(
          target: 1,
          suffix: '+',
          label: 'Years Learning',
          startAnimation: _isVisible,
        ),
        AnimatedCounter(
          target: 10,
          suffix: '+',
          label: 'UI Screens Designed',
          startAnimation: _isVisible,
        ),
        AnimatedCounter(
          target: 100,
          suffix: '+',
          label: 'Hours of Development',
          startAnimation: _isVisible,
        ),
        AnimatedCounter(
          target: 6,
          suffix: '+',
          label: 'Projects Built',
          startAnimation: _isVisible,
        ),
      ],
    );
  }

  Widget _buildMobileCounters() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: AnimatedCounter(
                target: 1,
                suffix: '+',
                label: 'Years Learning',
                startAnimation: _isVisible,
              ),
            ),
            Expanded(
              child: AnimatedCounter(
                target: 10,
                suffix: '+',
                label: 'UI Screens Designed',
                startAnimation: _isVisible,
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: AnimatedCounter(
                target: 100,
                suffix: '+',
                label: 'Hours of Development',
                startAnimation: _isVisible,
              ),
            ),
            Expanded(
              child: AnimatedCounter(
                target: 6,
                suffix: '+',
                label: 'Projects Built',
                startAnimation: _isVisible,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
