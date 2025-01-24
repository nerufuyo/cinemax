class ProductionCompanyEntity {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompanyEntity({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompanyEntity.fromJson(Map<String, dynamic> json) =>
      ProductionCompanyEntity(
        id: json["id"] ?? 0,
        logoPath: json["logo_path"] ?? '',
        name: json["name"] ?? '',
        originCountry: json["origin_country"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}
