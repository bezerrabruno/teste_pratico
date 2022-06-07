import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final controller = Get.find<HomeController>();
  final colors = Get.theme.colorScheme;

  AppBarWidget({Key? key}) : super(key: key);

  final _titles = <String>[
    'Courses',
    'Students',
    'Settings',
  ];

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Material(
          color: colors.primary,
          elevation: 10,
          child: SafeArea(
            child: Center(
              child: Text(
                _titles[controller.page],
                style: TextStyle(
                  color: colors.onPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
