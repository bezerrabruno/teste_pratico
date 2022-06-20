import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/pages.dart';
import 'theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.nestedKey(0),
      title: 'App Mobile',
      theme: AppTheme.theme(0),
      getPages: AppPages.pages,
      initialRoute: Routes.splash,
    );
  }
}
