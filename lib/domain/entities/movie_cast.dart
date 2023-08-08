class Actor {
  final int id;
  final String name;
  final String? character;
  final String? profilePath;

  Actor({
    required this.id,
    required this.name,
    this.character,
    this.profilePath,
  });
}
