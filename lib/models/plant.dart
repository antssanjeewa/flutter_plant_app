class Plant {
  final String name;
  final String description;
  final String scientificName;
  final List<String> tags;
  final String category;
  final String image;
  String? region;
  String? family;
  String? height;
  String? size;
  String? light;
  String? humidity;
  String? lifetime; // e.g., "Perennial", "Annual"
  String? propagationMethod; // e.g., "Cuttings", "Seeds"
  String? environment; // e.g., "Terrestrial", "Aquatic"
  bool isLiked;

  Plant({
    required this.name,
    required this.description,
    required this.scientificName,
    required this.tags,
    required this.category,
    required this.image,
    this.region,
    this.family,
    this.height,
    this.size,
    this.light,
    this.humidity,
    this.lifetime,
    this.propagationMethod,
    this.environment,
    this.isLiked = false,
  });
}
