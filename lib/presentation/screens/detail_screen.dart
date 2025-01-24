import 'package:cinemax/common/extensions/col_row_gap_extension.dart';
import 'package:cinemax/presentation/widgets/movie_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/styles/style.dart';
import '../controllers/contollers.dart';

class DetailScreen extends GetView<DetailController> {
  const DetailScreen({
    super.key,
    required this.movieId,
  });

  final String movieId;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.movieId.value = movieId;

      if (controller.movieDetail.isEmpty) {
        return const SizedBox.shrink();
      }

      final movie = controller.movieDetail[controller.movieId.value]!;
      return Scaffold(
        backgroundColor: AppColorPallete.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColorPallete.primaryColor,
          automaticallyImplyLeading: false,
          title: const Text(
            'Detail',
            style: AppTypography.h1,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: IconButton(
                onPressed: () => controller.popScreen(),
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  width: context.width,
                  height: context.height * 0.35,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                movie.title.toString(),
                style: AppTypography.h1,
              ),
              Text(
                movie.overview.toString(),
                style: AppTypography.body1,
              ),
              MovieCardWidget(
                'Upcoming',
                controller.upcomingMovieList,
              ),
            ],
          ).withSpacing(16),
        ),
      );
    });
  }
}
