import 'package:cinemax/common/constants/app_contant.dart';
import 'package:cinemax/domain/entities/entitiy.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

import '../common/services/dio_network_service.dart';

class MovieRemoteData {
  final Dio _dio = Get.find<DioNetworkService>().dio;

  MovieRemoteData();

  Future<List<MovieEntity>> _fetchMovies(String endpoint) async {
    final response = await _dio.get(
      '${AppContant.baseUrl}/movie/$endpoint',
      queryParameters: {'page': 1},
    );
    return (response.data['results'] as List)
        .map((x) => MovieEntity.fromJson(x))
        .toList();
  }

  Future<List<MovieEntity>> getUpcomingMovies() => _fetchMovies('upcoming');
  Future<List<MovieEntity>> getTopRatedMovies() => _fetchMovies('top_rated');
  Future<List<MovieEntity>> getPopularMovies() => _fetchMovies('popular');
  Future<List<MovieEntity>> getNowPlayingMovies() =>
      _fetchMovies('now_playing');

  Future<MovieEntity> getMovieDetail(int id) async {
    final response = await _dio.get('${AppContant.baseUrl}/movie/$id');
    return MovieEntity.fromJson(response.data);
  }
}
