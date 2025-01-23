import 'package:cinemax/common/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/contollers.dart';

class SliderHightlightMoviesWidget extends GetView<HomeController> {
  const SliderHightlightMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedSmoothIndicator(
            activeIndex: controller.currentCarouselMovieIndex.value,
            count: controller.popularMovieList.length > 5
                ? 5
                : controller.popularMovieList.length,
            effect: WormEffect(
              dotWidth: context.width * 0.05,
              dotHeight: 8,
              activeDotColor: AppColorPallete.secondaryColor,
              dotColor: Colors.grey,
            ),
          ),
        ));
  }
}
