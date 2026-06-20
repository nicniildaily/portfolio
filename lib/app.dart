import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'theme/app_theme.dart';
import 'widgets/navigation_bar.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/design_gallery.dart';
import 'sections/experience_section.dart';
import 'sections/personal_gallery.dart';
import 'sections/resume_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer_section.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abigael Kamau — Flutter Developer & Product Builder',
      theme: buildTheme(),
      debugShowCheckedModeBanner: false,
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  late final List<GlobalKey> _sectionKeys;

  bool _isScrolled = false;
  int _activeSection = 0;

  static const List<String> _navItems = ['Home', 'About', 'Skills', 'Projects', 'Gallery', 'Experience', 'Contact'];

  @override
  void initState() {
    super.initState();
    _sectionKeys = [_heroKey, _aboutKey, _skillsKey, _projectsKey, _galleryKey, _experienceKey, _contactKey];
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    setState(() {
      _isScrolled = offset > 80;
      _activeSection = _findActiveSection();
    });
  }

  int _findActiveSection() {
    for (int i = _sectionKeys.length - 1; i >= 0; i--) {
      final context = _sectionKeys[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          if (position.dy < 200) return i;
        }
      }
    }
    return 0;
  }

  Future<void> _downloadResume() async {
    try {
      final byteData = await rootBundle.load('assets/resume/ABIGAEL RESUME.pdf');
      await FileSaver.instance.saveFile(
        name: 'ABIGAEL_KAMAU_Resume',
        bytes: byteData.buffer.asUint8List(),
        ext: 'pdf',
        mimeType: MimeType.pdf,
      );
    } catch (_) {
      // silently fail — user can try again
    }
  }

  void _scrollToSection(int index) {
    if (index < 0 || index >= _sectionKeys.length) return;
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints(
      breakpoints: [
        const Breakpoint(start: 0, end: 599, name: MOBILE),
        const Breakpoint(start: 600, end: 899, name: TABLET),
        const Breakpoint(start: 900, end: double.infinity, name: DESKTOP),
      ],
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.only(top: 72),
            child: Column(
              children: [
                Container(key: _heroKey, child: HeroSection(onDownloadResume: _downloadResume)),
                Container(key: _aboutKey, child: const AboutSection()),
                Container(key: _skillsKey, child: const SkillsSection()),
                Container(key: _projectsKey, child: const ProjectsSection()),
                Container(key: _galleryKey, child: const DesignGallery()),
                Container(
                  key: _experienceKey,
                  child: ExperienceSection(scrollController: _scrollController),
                ),
                const PersonalGallery(),
                //const TestimonialsSection(),
                ResumeSection(onDownloadResume: _downloadResume),
                Container(key: _contactKey, child: const ContactSection()),
                const FooterSection(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PortfolioNavBar(
              isScrolled: _isScrolled,
              navItems: _navItems,
              activeIndex: _activeSection,
              onNavItemTap: _scrollToSection,
              onDownloadCv: _downloadResume,
            ),
          ),
        ],
      ),
    );
  }
}
