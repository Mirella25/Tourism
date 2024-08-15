import 'package:get/get.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/middleware/myMiddleware.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 5), () {
      MyMiddleware myMiddleware = MyMiddleware();

      final redirectSettings = myMiddleware.redirect(null);

      if (redirectSettings != null) {
        // التوجيه إلى المسار المحدد
        Get.offNamed(redirectSettings.name!);
      } else {
        Get.offNamed(AppRoute.onboarding);
      }
    });
  }
}
