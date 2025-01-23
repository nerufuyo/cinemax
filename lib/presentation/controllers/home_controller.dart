import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemax/common/extensions/get_interface_extension.dart';
import 'package:cinemax/domain/entities/entitiy.dart';
import 'package:cinemax/domain/repositories/movie_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final MovieRepository _repository = Get.tryPut(MovieRepository());
  final CarouselSliderController carouselController =
      CarouselSliderController();

  RxList<MovieResultEntity> popularMovieList = <MovieResultEntity>[].obs;
  RxList<MovieResultEntity> upcomingMovieList = <MovieResultEntity>[].obs;
  RxList<MovieResultEntity> nowPlayingMovieList = <MovieResultEntity>[].obs;
  RxList<MovieResultEntity> topRatedMovieList = <MovieResultEntity>[].obs;

  RxInt currentIndex = 0.obs;
  RxInt currentCarouselMovieIndex = 0.obs;

  void changeIndex(int index) => currentIndex.value = index;

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  void initialize() {
    Future.wait([
      getPopularMovies(),
      getUpcomingMovies(),
      getNowPlayingMovies(),
      getTopRatedMovies(),
    ]);
  }

  Future<void> getPopularMovies() async {
    final result = await _repository.getPopularMovies();

    result.fold(
      (error) => log('Get Popular Movies Error: $error'),
      (data) => popularMovieList.value = data,
    );
  }

  Future<void> getUpcomingMovies() async {
    final result = await _repository.getUpcomingMovies();

    result.fold(
      (error) => log('Get Upcoming Movies Error: $error'),
      (data) => upcomingMovieList.value = data,
    );
  }

  Future<void> getNowPlayingMovies() async {
    final result = await _repository.getNowPlayingMovies();

    result.fold(
      (error) => log('Get Now Playing Movies Error: $error'),
      (data) => nowPlayingMovieList.value = data,
    );
  }

  Future<void> getTopRatedMovies() async {
    final result = await _repository.getTopRatedMovies();

    result.fold(
      (error) => log('Get Top Rated Movies Error: $error'),
      (data) => topRatedMovieList.value = data,
    );
  }
}
