import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';

class PortfolioNavBar extends StatefulWidget {
  final bool isScrolled;
  final List<String> navItems;
  final int activeIndex;
  final ValueChanged<int> onNavItemTap;
  final VoidCallback onDownloadCv;

  const PortfolioNavBar({
    super.key,
    required this.isScrolled,
    required this.navItems,
    required this.activeIndex,
    required this.onNavItemTap,
    required this.onDownloadCv,
  });

  @override
  State<PortfolioNavBar> createState() => _PortfolioNavBarState();
}

class _PortfolioNavBarState extends State<PortfolioNavBar> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: widget.isScrolled
            ? Colors.white
            : Colors.white.withValues(alpha: 0),
        boxShadow: widget.isScrolled
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 20,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  'Abigael Kamau',
                  style: AppText.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Spacer(),
                if (isMobile)
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => _openDrawer(context),
                    color: AppColors.textPrimary,
                  )
                else ...[
                  ...List.generate(widget.navItems.length, (index) {
                    return _NavLink(
                      label: widget.navItems[index],
                      isActive: widget.activeIndex == index,
                      onTap: () => widget.onNavItemTap(index),
                    );
                  }),
                  const SizedBox(width: 20),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: widget.onDownloadCv,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      child: const Text('Download Resume', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(widget.navItems.length, (index) {
                return ListTile(
                  title: Text(
                    widget.navItems[index],
                    style: AppText.inter(
                      fontSize: 16,
                      fontWeight: widget.activeIndex == index
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: widget.activeIndex == index
                          ? AppColors.primary
                          : AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    widget.onNavItemTap(index);
                  },
                );
              }),
              const Divider(indent: 24, endIndent: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      widget.onDownloadCv();
                    },
                    child: const Text('Download Resume'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavLink({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Text(
          label,
          style: AppText.inter(
            fontSize: 14,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            color: isActive ? AppColors.primary : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
