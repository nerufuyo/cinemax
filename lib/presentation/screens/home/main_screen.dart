import 'package:cinemax/common/extensions/col_row_gap_extension.dart';
import 'package:cinemax/presentation/screens/screens.dart';
import 'package:cinemax/presentation/widgets/movie_card_widget.dart';
import 'package:cinemax/presentation/widgets/slider_popular_movies_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends HomeScreen {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SliderPopularMoviesWidget(),
          MovieCardWidget(
            'Now Playing',
            controller.upcomingMovieList,
          ),
          MovieCardWidget(
            'Upcoming',
            controller.nowPlayingMovieList,
          ),
          MovieCardWidget(
            'Top Rated',
            controller.topRatedMovieList,
          ),
        ],
      ).withSpacing(16),
    );
  }
}
