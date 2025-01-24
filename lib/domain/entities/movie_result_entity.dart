import 'package:cinemax/domain/entities/entitiy.dart';

class MovieResultEntity {
  final bool? adult;
  final String? backdropPath;
  final dynamic belongsToCollection;
  final int? budget;
  final List<GenreEntity>? genres;
  final List<int>? genreIds;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanyEntity>? productionCompanies;
  final List<ProductionCountryEntity>? productionCountries;
  final DateTime? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguageEntity>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieResultEntity({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.genreIds,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieResultEntity.fromJson(Map<String, dynamic> json) =>
      MovieResultEntity(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"] ?? '', // Default to empty string
        belongsToCollection: json["belongs_to_collection"] ?? '', // Nullable
        budget: json["budget"] ?? 0,
        genres: (json["genres"] as List<dynamic>?)
                ?.map((x) => GenreEntity.fromJson(x))
                .toList() ??
            [], // Default to empty list
        genreIds: (json["genre_ids"] as List<dynamic>?)
                ?.map((x) => x as int)
                .toList() ??
            [], // Default to empty list
        homepage: json["homepage"] ?? '', // Default to empty string
        id: json["id"] ?? 0,
        imdbId: json["imdb_id"] ?? '', // Default to empty string
        originCountry: (json["origin_country"] as List<dynamic>?)
                ?.map((x) => x as String)
                .toList() ??
            [], // Default to empty list
        originalLanguage: json["original_language"] ?? '',
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"] ?? '',
        popularity: (json["popularity"] as num?)?.toDouble() ?? 0.0,
        posterPath: json["poster_path"] ?? '', // Default to empty string
        productionCompanies: (json["production_companies"] as List<dynamic>?)
                ?.map((x) => ProductionCompanyEntity.fromJson(x))
                .toList() ??
            [], // Default to empty list
        productionCountries: (json["production_countries"] as List<dynamic>?)
                ?.map((x) => ProductionCountryEntity.fromJson(x))
                .toList() ??
            [], // Default to empty list
        releaseDate: json["release_date"] != null
            ? DateTime.tryParse(json["release_date"]) ?? DateTime(1970, 1, 1)
            : DateTime(1970, 1, 1), // Safe fallback
        revenue: json["revenue"] ?? 0,
        runtime: json["runtime"] ?? 0,
        spokenLanguages: (json["spoken_languages"] as List<dynamic>?)
                ?.map((x) => SpokenLanguageEntity.fromJson(x))
                .toList() ??
            [], // Default to empty list
        status: json["status"] ?? '',
        tagline: json["tagline"] ?? '',
        title: json["title"] ?? '',
        video: json["video"] ?? false,
        voteAverage: (json["vote_average"] as num?)?.toDouble() ?? 0.0,
        voteCount: json["vote_count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget,
        "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "origin_country": List<dynamic>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies":
            List<dynamic>.from(productionCompanies!.map((x) => x.toJson())),
        "production_countries":
            List<dynamic>.from(productionCountries!.map((x) => x.toJson())),
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages":
            List<dynamic>.from(spokenLanguages!.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
