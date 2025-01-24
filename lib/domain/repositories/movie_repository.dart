import 'package:cinemax/common/extensions/get_interface_extension.dart';
import 'package:cinemax/common/utils/dartz_try_catch.dart';
import 'package:cinemax/data/movie_remote_data.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../entities/entitiy.dart';

class MovieRepository {
  final MovieRemoteData _movieRemoteData = Get.tryPut(MovieRemoteData());

  Future<Either<String, dynamic>> _fetchMovies(
    Future<MovieEntity> Function() fetchMoviesFunction,
    String errorMessage,
  ) =>
      DartzTryCatch.network(() async {
        final response = await fetchMoviesFunction();

        if (response.results != null && response.results!.isNotEmpty) {
          return response.results!;
        }

        throw Exception(errorMessage);
      });

  Future<Either<String, dynamic>> getUpcomingMovies() => _fetchMovies(
        _movieRemoteData.getRawUpcomingMovies,
        'Get Upcoming Movies Failed!',
      );

  Future<Either<String, dynamic>> getTopRatedMovies() => _fetchMovies(
        _movieRemoteData.getRawTopRatedMovies,
        'Get Top Rated Movies Failed!',
      );

  Future<Either<String, dynamic>> getPopularMovies() => _fetchMovies(
        _movieRemoteData.getRawPopularMovies,
        'Get Popular Movies Failed!',
      );

  Future<Either<String, dynamic>> getNowPlayingMovies() => _fetchMovies(
        _movieRemoteData.getRawNowPlayingMovies,
        'Get Now Playing Movies Failed!',
      );

  Future<Either<String, dynamic>> getMovieDetail(String id) =>
      DartzTryCatch.network(() async {
        final response = await _movieRemoteData.getRawMovieDetail(id);

        if (response.id != null) {
          return response;
        }

        throw Exception('Get Movie Detail Failed!');
      });
}
