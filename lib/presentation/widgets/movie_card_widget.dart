import 'package:cinemax/common/extensions/col_row_gap_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/styles/style.dart';
import '../controllers/contollers.dart';

class MovieCardWidget extends GetView<HomeController> {
  const MovieCardWidget(this.title, this.movieLists, {super.key});

  final String title;
  final List movieLists;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              title,
              style: AppTypography.h1,
            ),
          ),
          if (movieLists.isNotEmpty)
            SizedBox(
              height: context.height * 0.25,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                padding: const EdgeInsets.only(left: 16),
                shrinkWrap: true,
                itemCount: movieLists.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 120,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500/${movieLists[index].posterPath}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ).withSpacing(16),
    );
  }
}
