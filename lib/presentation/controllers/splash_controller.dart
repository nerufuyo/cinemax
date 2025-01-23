import 'package:cinemax/common/routes/route_path.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../common/routes/router.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _navigateScreen();
    super.onInit();
  }

  void _navigateScreen() => Future.delayed(
        const Duration(seconds: 3),
        () => GoRouter.of(globalKey.currentContext!).goNamed(ScreenName.home),
      );
}
