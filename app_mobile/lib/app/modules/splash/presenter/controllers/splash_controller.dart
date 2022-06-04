import 'package:app_mobile/app/core/routes/pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    next();
    super.onInit();
  }

  void next() async {
    await 2.delay();

    Get.toNamed(Routes.home);
  }
}
