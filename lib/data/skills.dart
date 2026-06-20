import 'package:flutter/material.dart';

class SkillCategory {
  final String title;
  final List<String> skills;
  final IconData icon;

  const SkillCategory({
    required this.title,
    required this.skills,
    required this.icon,
  });
}

final List<SkillCategory> skillCategories = [
  const SkillCategory(
    title: 'Flutter Development',
    icon: Icons.phone_android,
    skills: [
      'Flutter',
      'Dart',
      'Firebase',
      'REST APIs',
      'State Management',
    ],
  ),
  const SkillCategory(
    title: 'Web Development',
    icon: Icons.language,
    skills: [
      'Responsive Design',
      'HTML',
      'CSS',
      'JavaScript',
      'Flutter Web',
    ],
  ),
  const SkillCategory(
    title: 'UI/UX Design',
    icon: Icons.palette,
    skills: [
      'Canva',
      'Wireframing',
      'User Research',
      'Mobile Design',
      'Prototyping',
    ],
  ),
  const SkillCategory(
    title: 'Branding & Graphics',
    icon: Icons.design_services,
    skills: [
      'Logo Design',
      'Brand Identity',
      'Marketing Materials',
      'Product Presentation',
    ],
  ),
  const SkillCategory(
    title: 'Product Development',
    icon: Icons.rocket_launch,
    skills: [
      'Idea Validation',
      'Product Strategy',
      'MVP Development',
      'App Launch Planning',
    ],
  ),
  const SkillCategory(
    title: 'Soft Skills',
    icon: Icons.people,
    skills: [
      'Problem Solving',
      'Communication',
      'Creativity',
      'Self Learning',
      'Project Management',
    ],
  ),
];
