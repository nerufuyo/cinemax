import 'package:cinemax/common/constants/app_contant.dart';
import 'package:cinemax/common/routes/route_path.dart';
import 'package:cinemax/common/services/dio_network_service.dart';
import 'package:cinemax/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/controllers/contollers.dart';
import '../../presentation/screens/screens.dart';

final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: globalKey,
  initialLocation: RoutePath.splash,
  routes: [
    GoRoute(
      name: ScreenName.splash,
      path: RoutePath.splash,
      builder: (context, state) {
        Get.put(DioNetworkService(AppContant.baseUrl));
        Get.put(SplashController());
        return const SplashScreen();
      },
      onExit: (context, state) => Get.delete<SplashController>(),
    ),
    GoRoute(
      name: ScreenName.auth,
      path: RoutePath.auth,
    ),
    GoRoute(
      name: ScreenName.home,
      path: RoutePath.home,
      builder: (context, state) {
        Get.put(HomeController());
        return const HomeScreen();
      },
    ),
    GoRoute(
      name: ScreenName.detail,
      path: RoutePath.detail,
    ),
  ],
);
