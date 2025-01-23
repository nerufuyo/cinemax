import 'package:cinemax/presentation/screens/screens.dart';
import 'package:cinemax/presentation/widgets/slider_popular_movies.dart';
import 'package:flutter/material.dart';

class MainScreen extends HomeScreen {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SliderPopularMoviles(),
        ],
      ),
    );
  }
}
