import 'dart:convert';

import 'package:cinemax/domain/entities/entitiy.dart';

MovieEntity movieEntityFromJson(String str) =>
    MovieEntity.fromJson(json.decode(str));

String movieEntityToJson(MovieEntity data) => json.encode(data.toJson());

class MovieEntity {
  final DateEntity dates;
  final int page;
  final List<MovieResultEntity> results;
  final int totalPages;
  final int totalResults;

  MovieEntity({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) => MovieEntity(
        dates: DateEntity.fromJson(json["dates"]),
        page: json["page"],
        results: List<MovieResultEntity>.from(
            json["results"].map((x) => MovieResultEntity.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "dates": dates.toJson(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
