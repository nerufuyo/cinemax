import 'dart:convert';

import 'entitiy.dart';

SearchMovieEntity searchMovieEntityFromJson(String str) =>
    SearchMovieEntity.fromJson(json.decode(str));

String searchMovieEntityToJson(SearchMovieEntity data) =>
    json.encode(data.toJson());

class SearchMovieEntity {
  final int? page;
  final List<SearchMovieListEntity>? results;
  final int? totalPages;
  final int? totalResults;

  SearchMovieEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchMovieEntity.fromJson(Map<String, dynamic> json) =>
      SearchMovieEntity(
        page: json["page"] ?? 0,
        results: List<SearchMovieListEntity>.from(
            json["results"].map((x) => SearchMovieListEntity.fromJson(x))),
        totalPages: json["total_pages"] ?? 0,
        totalResults: json["total_results"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
