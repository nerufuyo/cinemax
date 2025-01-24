import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemax/common/extensions/col_row_gap_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/styles/style.dart';
import '../controllers/contollers.dart';

class SliderPopularMoviesWidget extends GetView<HomeController> {
  const SliderPopularMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentMovie = controller.popularMovieList.isNotEmpty
          ? controller
              .popularMovieList[controller.currentCarouselMovieIndex.value]
          : null;

      return SizedBox(
        height: context.height * 0.5,
        child: Stack(
          children: [
            CarouselSlider(
              carouselController: controller.carouselController,
              items: controller.popularMovieList.take(5).map((movie) {
                return Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  width: context.width,
                  fit: BoxFit.cover,
                );
              }).toList(),
              options: CarouselOptions(
                height: context.height * 0.5,
                viewportFraction: 1,
                aspectRatio: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 6),
                onPageChanged: (index, reason) =>
                    controller.currentCarouselMovieIndex.value = index,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.75),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            if (currentMovie != null)
              Positioned(
                left: 16,
                right: 16,
                bottom: context.height * 0.025,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 28,
                          ),
                          Text(
                            currentMovie.voteAverage.toString(),
                            style: AppTypography.h2.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ).withSpacing(8),
                      Text(
                        currentMovie.title ?? '',
                        style: AppTypography.h1.copyWith(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 58,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: [
                                  AppColorPallete.ternaryColor,
                                  AppColorPallete.ternaryColor,
                                  AppColorPallete.secondaryColor,
                                  AppColorPallete.secondaryColor,
                                ],
                              ),
                            ),
                            child: InkWell(
                              onTap: () => controller.showDetail(
                                context,
                                controller
                                    .popularMovieList[controller
                                        .currentCarouselMovieIndex.value]
                                    .id
                                    .toString(),
                              ),
                              child: Text(
                                'Watch Now',
                                style: AppTypography.body1.copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ).withSpacing(16),
                    ],
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}
