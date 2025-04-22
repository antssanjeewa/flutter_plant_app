class Plant {
  final String name;
  final String description;
  final String scientificName;
  final String region;
  final List<String> tags;
  final String category;
  final String image;
  bool isLiked;

  Plant({
    required this.name,
    required this.description,
    required this.scientificName,
    required this.region,
    required this.tags,
    required this.category,
    required this.image,
    this.isLiked = false,
  });
}
