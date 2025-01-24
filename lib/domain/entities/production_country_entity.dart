class ProductionCountryEntity {
  final String? iso31661;
  final String? name;

  ProductionCountryEntity({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountryEntity.fromJson(Map<String, dynamic> json) =>
      ProductionCountryEntity(
        iso31661: json["iso_3166_1"] ?? '',
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}
