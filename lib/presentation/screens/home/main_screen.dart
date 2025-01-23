import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemax/common/constants/app_constant.dart';
import 'package:cinemax/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class MainScreen extends HomeScreen {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CarouselSlider(
            items: List.generate(controller.movies.length, (index) {
              final movie = controller.movies[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
            ),
          ),
        ],
      ),
    );
  }
}
