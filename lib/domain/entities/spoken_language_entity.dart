class SpokenLanguageEntity {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguageEntity({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguageEntity.fromJson(Map<String, dynamic> json) =>
      SpokenLanguageEntity(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
