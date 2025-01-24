import 'package:cinemax/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/styles/style.dart';

class SearchScreen extends HomeScreen {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColorPallete.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColorPallete.primaryColor,
          title: TextField(
            controller: controller.searchController,
            style: AppTypography.h3,
            decoration: const InputDecoration(
              hintText: 'Search',
              hintStyle: AppTypography.h3,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: InputBorder.none,
            ),
            onSubmitted: (value) => controller.getMovieByKeyword(value),
          ),
        ),
        body: ListView.builder(
          itemCount: controller.searchMovieList.length,
          itemBuilder: (context, index) {
            final movie = controller.searchMovieList[index];
            return InkWell(
              onTap: () => controller.showDetail(context, movie.id.toString()),
              child: ListTile(
                title: Text(
                  movie.name.toString(),
                  style: AppTypography.h3,
                ),

                // onTap: () => controller.goToDetailScreen(movie.id.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
