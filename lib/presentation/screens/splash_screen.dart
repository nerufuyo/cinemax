import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/styles/style.dart';
import '../controllers/contollers.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColorPallete.primaryColor,
        body: Center(
          child: Text(
            'CINEMAX',
            style: AppTypography.h1.copyWith(fontSize: 80),
          ),
        ),
      ),
    );
  }
}
