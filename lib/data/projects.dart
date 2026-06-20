import '../models/project.dart';

final List<Project> projects = [
  const Project(
    name: 'Velmique Beauty',
    description:
        'A beauty products marketplace connecting customers with trusted beauty vendors through a modern shopping experience.',
    technologies: ['Flutter', 'Firebase', 'REST APIs'],
    imageSeed: 'velmique',
    imageAsset: 'assets/logos/velmique.png',
    liveDemoAsset: 'assets/demos/velmique/velmique.mp4',
  ),
  const Project(
    name: 'Pelinotes',
    description:
        'A digital notebook application for seamless note-taking and organization across devices.',
    technologies: ['Flutter', 'Local Storage', 'UI/UX'],
    imageSeed: 'pelinotes',
    imageAsset: 'assets/logos/pelinotes.png',
    liveDemoAsset: 'assets/demos/pelinotes/pelinotes.mp4',
  ),
  const Project(
    name: 'Budgibuddy',
    description:
        'An expense tracking app that helps users manage finances, track spending, and reach savings goals.',
    technologies: ['Flutter', 'Firebase', 'Charts'],
    imageSeed: 'budgibuddy',
    imageAsset: 'assets/logos/budgibuddy.png',
    liveDemoAsset: 'assets/demos/budgibuddy/budgibuddy.mp4',
  ),
  const Project(
    name: 'Mawemaji',
    description:
        'An environmental solution addressing water-related challenges through technology and community engagement.',
    technologies: ['Flutter', 'Maps API', 'Cloud Services'],
    imageSeed: 'mawemaji',
    imageAsset: 'assets/logos/mawemaji.png',
  ),
  const Project(
    name: 'Personal & Business Websites',
    description:
        'Responsive websites for showcasing products, services, and portfolios across desktop and mobile.',
    technologies: ['Flutter Web', 'Responsive Design', 'Deployment'],
    imageSeed: 'websites',
  ),
  const Project(
    name: 'UI/UX Design Portfolio',
    description:
        'Mobile interfaces, website layouts, wireframes, and prototypes focused on usability and visual appeal.',
    technologies: ['Canva', 'Wireframing', 'Prototyping'],
    imageSeed: 'designworks',
  ),
];
