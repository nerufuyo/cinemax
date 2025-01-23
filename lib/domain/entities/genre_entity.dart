class GenreEntity {
  final int id;
  final String name;

  GenreEntity({
    required this.id,
    required this.name,
  });

  factory GenreEntity.fromJson(Map<String, dynamic> json) => GenreEntity(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
