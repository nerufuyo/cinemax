import 'dart:ui';

import 'package:cinemax/common/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/app_menu.dart';
import '../controllers/contollers.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColorPallete.primaryColor,
        body: homeScreens[controller.currentIndex.value],
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
              tileMode: TileMode.repeated,
            ),
            child: BottomNavigationBar(
              onTap: controller.changeIndex,
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedLabelStyle: AppTypography.h3,
              unselectedLabelStyle: AppTypography.h3,
              items: List.generate(
                homeBottomNavItems.length,
                (index) {
                  final item = homeBottomNavItems[index];
                  return BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 4),
                      child: Image.asset(
                        index == controller.currentIndex.value
                            ? item['iconFilled']
                            : item['icon'],
                        width: 24,
                        height: 24,
                      ),
                    ),
                    label: item['label'],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
