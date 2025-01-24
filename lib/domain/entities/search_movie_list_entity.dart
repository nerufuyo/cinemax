class SearchMovieListEntity {
  final int? id;
  final String? name;

  SearchMovieListEntity({
    required this.id,
    required this.name,
  });

  factory SearchMovieListEntity.fromJson(Map<String, dynamic> json) =>
      SearchMovieListEntity(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
