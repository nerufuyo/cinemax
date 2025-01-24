import 'package:cinemax/common/constants/app_constant.dart';
import 'package:cinemax/domain/entities/entitiy.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

import '../common/services/dio_network_service.dart';

class MovieRemoteData {
  final Dio _dio = Get.find<DioNetworkService>().dio;

  MovieRemoteData();

  Future<MovieEntity> _getRawMovies(String endpoint) async {
    final response = await _dio.get('${AppConstant.baseUrl}/movie/$endpoint');
    return MovieEntity.fromJson(response.data);
  }

  Future<MovieEntity> getRawUpcomingMovies() => _getRawMovies('upcoming');
  Future<MovieEntity> getRawTopRatedMovies() => _getRawMovies('top_rated');
  Future<MovieEntity> getRawPopularMovies() => _getRawMovies('popular');
  Future<MovieEntity> getRawNowPlayingMovies() => _getRawMovies('now_playing');

  Future<MovieResultEntity> getRawMovieDetail(String id) async {
    final response = await _dio.get('${AppConstant.baseUrl}/movie/$id');
    return MovieResultEntity.fromJson(response.data);
  }

  Future<SearchMovieEntity> getRawMovieByKeyword(String query) async {
    final response = await _dio.get(
      '${AppConstant.baseUrl}/search/movie',
      queryParameters: {'query': query},
    );

    return SearchMovieEntity.fromJson(response.data);
  }
}
