import 'package:cinemax/common/utils/dartz_try_catch.dart';
import 'package:cinemax/data/movie_remote_data.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../entities/entitiy.dart';

class MovieRepository {
  final MovieRemoteData _movieRemoteData = Get.put(MovieRemoteData());

  MovieRepository();

  Future<Either<String, List<MovieEntity>>> getUpcomingMovies() =>
      DartzTryCatch.network(() async {
        final response = await _movieRemoteData.getUpcomingMovies();

        if (response.isNotEmpty) {
          return response;
        }

        throw Exception('Get Upcoming Movies Failed!');
      });

  Future<Either<String, List<MovieEntity>>> getTopRatedMovies() =>
      DartzTryCatch.network(() async {
        final response = await _movieRemoteData.getTopRatedMovies();

        if (response.isNotEmpty) {
          return response;
        }

        throw Exception('Get Top Rated Movies Failed!');
      });

  Future<Either<String, List<MovieEntity>>> getPopularMovies() =>
      DartzTryCatch.network(() async {
        final response = await _movieRemoteData.getPopularMovies();

        if (response.isNotEmpty) {
          return response;
        }

        throw Exception('Get Popular Movies Failed!');
      });

  Future<Either<String, List<MovieEntity>>> getNowPlayingMovies() =>
      DartzTryCatch.network(() async {
        final response = await _movieRemoteData.getNowPlayingMovies();

        if (response.isNotEmpty) {
          return response;
        }

        throw Exception('Get Now Playing Movies Failed!');
      });

  Future<Either<String, MovieEntity>> getMovieDetail(int id) =>
      DartzTryCatch.network(() async {
        final response = await _movieRemoteData.getMovieDetail(id);

        if (response.results.isNotEmpty) {
          return response;
        }

        throw Exception('Get Movie Detail Failed!');
      });
}
