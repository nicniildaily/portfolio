import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';

class AnimatedCounter extends StatefulWidget {
  final double target;
  final String suffix;
  final String label;
  final bool startAnimation;

  const AnimatedCounter({
    super.key,
    required this.target,
    required this.suffix,
    required this.label,
    required this.startAnimation,
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = _controller.drive(
      Tween<double>(begin: 0, end: widget.target),
    );
  }

  @override
  void didUpdateWidget(AnimatedCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.startAnimation && !oldWidget.startAnimation) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        final value = _animation.value.toStringAsFixed(0);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$value${widget.suffix}',
              style: AppText.playfairDisplay(
                fontSize: 48,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.label,
              style: AppText.inter(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
