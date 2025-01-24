import 'dart:developer';

import 'package:cinemax/common/constants/app_constant.dart';
import 'package:cinemax/common/extensions/get_interface_extension.dart';
import 'package:cinemax/common/routes/router.dart';
import 'package:cinemax/domain/entities/entitiy.dart';
import 'package:cinemax/domain/repositories/movie_repository.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class DetailController extends GetxController {
  final MovieRepository _repository = Get.tryPut(MovieRepository());
  late VideoPlayerController videoPlayerController;

  RxList<MovieResultEntity> upcomingMovieList = <MovieResultEntity>[].obs;
  RxMap<String, MovieResultEntity> movieDetail =
      <String, MovieResultEntity>{}.obs;
  RxString movieId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  void initialize() {
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(AppConstant.defaultTeaser),
    )..initialize().then((_) {
        videoPlayerController.play();
        videoPlayerController.setLooping(true);
        videoPlayerController.setPlaybackSpeed(4.0);
      });
    Future.delayed(const Duration(milliseconds: 500), () {
      log('Movie ID: ${movieId.value}');
      Future.wait([
        getUpcomingMovies(),
        getMovieDetail(movieId.value),
      ]);
    });
  }

  void popScreen() {
    Get.delete<DetailController>();
    GoRouter.of(globalKey.currentContext!).pop();
  }

  Future<void> getMovieDetail(String movieId) async {
    final response = await _repository.getMovieDetail(movieId);

    response.fold(
      (error) => log('Get Movie Detail Error: $error'),
      (data) => movieDetail[movieId] = data,
    );
  }

  Future<void> getUpcomingMovies() async {
    final result = await _repository.getUpcomingMovies();

    result.fold(
      (error) => log('Get Upcoming Movies Error: $error'),
      (data) => upcomingMovieList.value = data,
    );
  }
}
