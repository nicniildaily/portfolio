# portfolio_web

Personal portfolio website for Abigael Kamau — Flutter Developer, Product Builder & Digital Creator. Built with Flutter Web.

## Commands

```bash
flutter pub get          # install/update dependencies
flutter analyze          # static analysis (must be clean before run)
flutter test             # run all tests
flutter test test/widget_test.dart
flutter run -d chrome    # dev server with hot reload
flutter build web        # production build (output in build/web/)
```

## Key dependencies

- `responsive_framework` — breakpoints and responsive layout
- `google_fonts` — Playfair Display (headings) + Inter (body)
- `flutter_staggered_grid_view` — masonry gallery layout
- `cached_network_image` — placeholder images from picsum.photos
- `url_launcher` — external links

## Project structure

```
lib/
  main.dart                      # entrypoint → runApp(PortfolioApp())
  app.dart                       # PortfolioApp (MaterialApp) + PortfolioPage with scroll nav
  theme/
    app_colors.dart              # color palette constants
    app_theme.dart               # ThemeData with Google Fonts text styles
    app_text.dart                # GoogleFonts wrapper (decoration: none)
  models/
    project.dart                 # Project data class
  data/
    projects.dart                # 6 project entries (Velmique, Pelinotes, Budgibuddy, etc.)
    skills.dart                  # 6 skill categories with nested items
  sections/
    hero_section.dart            # intro + placeholder photo
    about_section.dart           # 4-paragraph story
    skills_section.dart          # responsive grid of skill cards
    projects_section.dart        # responsive grid of project cards
    design_gallery.dart          # masonry gallery with tap-to-preview
    experience_section.dart      # scroll-triggered count-up metrics
    personal_gallery.dart        # Behind The Work photo grid
    testimonials_section.dart    # placeholder recommendation cards
    resume_section.dart          # CV download CTA (non-functional)
    contact_section.dart         # contact info + form UI (visual only)
    footer_section.dart          # links, socials, copyright
  widgets/
    navigation_bar.dart          # PortfolioNavBar — sticky, scroll-aware, mobile drawer
    section_header.dart          # reusable section title
    project_card.dart            # image + desc + tech tags + buttons
    skill_card.dart              # single skill category card
    animated_counter.dart        # animated number counter
```

## Architecture notes

- **Navigation**: `PortfolioPage` manages a `ScrollController` and `GlobalKey` per section. Nav tap calls `Scrollable.ensureVisible()` for smooth scroll.
- **Responsive**: `ResponsiveBreakpoints` at root with breakpoints 0-599/600-899/900+. Section grids use `MediaQuery` width checks. Content centers at `maxWidth: 1000`.
- **Images**: All from `https://picsum.photos/seed/{seed}/{w}/{h}` — deterministic, free, no API key. Replace seeds with real paths later.
- **Colors**: `AppColors` class matches spec exactly (primary `#4338CA`, secondary `#7C3AED`, accent `#F97316`, etc.).
- **Typography**: Playfair Display (headings w700), Inter (body w400) via `google_fonts` package.
- **Analytics**: None. SEO is limited to `<title>` and `<meta>` in `web/index.html`.

## Placeholder content

- Name: Abigael Kamau (update in `app.dart` and `navigation_bar.dart` if needed)
- Email: abigael@example.com
- Phone: +254 700 000 000
- LinkedIn/GitHub: placeholder URLs
- Photos: all picsum.photos seeds (swap for real images later)
