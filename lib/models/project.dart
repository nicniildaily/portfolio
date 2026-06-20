class Project {
  final String name;
  final String description;
  final List<String> technologies;
  final String imageSeed;
  final String? imageAsset;
  final String? liveDemoAsset;

  const Project({
    required this.name,
    required this.description,
    required this.technologies,
    required this.imageSeed,
    this.imageAsset,
    this.liveDemoAsset,
  });
}
