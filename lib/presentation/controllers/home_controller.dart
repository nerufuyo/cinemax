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
  RxInt currentIndex = 0.obs;
  RxInt currentCarouselMovieIndex = 0.obs;

  void changeIndex(int index) => currentIndex.value = index;

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  void initialize() {
    getPopularMovies();
  }

  Future<void> getPopularMovies() async {
    final result = await _repository.getPopularMovies();

    result.fold(
      (error) => log('Get Popular Movies Error: $error'),
      (data) => popularMovieList.value = data,
    );
  }
}
