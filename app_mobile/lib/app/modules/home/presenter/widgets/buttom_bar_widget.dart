import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class ButtomBarWidget extends StatelessWidget {
  final controller = Get.find<HomeController>();
  final colors = Get.theme.colorScheme;

  ButtomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: kToolbarHeight,
        width: double.maxFinite,
        child: Material(
          color: colors.primary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: double.maxFinite,
                width: 60,
                child: Material(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => controller.page = 0,
                    borderRadius: BorderRadius.circular(100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        controller.page == 0
                            ? Icon(
                                Icons.book,
                                color: colors.secondary,
                                size: 35,
                              )
                            : Icon(
                                Icons.book_outlined,
                                color: colors.onPrimary.withOpacity(0.7),
                                size: 35,
                              ),
                        Text(
                          'Courses',
                          style: TextStyle(
                            fontSize: 12,
                            color: controller.page == 0
                                ? colors.onPrimary
                                : colors.onPrimary.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => controller.page = 1,
                child: SizedBox(
                  height: double.infinity,
                  width: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      controller.page == 1
                          ? Icon(
                              Icons.people_alt,
                              color: colors.secondary,
                              size: 35,
                            )
                          : Icon(
                              Icons.people_alt_outlined,
                              color: colors.onPrimary.withOpacity(0.7),
                              size: 35,
                            ),
                      Text(
                        'Students',
                        style: TextStyle(
                          fontSize: 12,
                          color: controller.page == 1
                              ? colors.onPrimary
                              : colors.onPrimary.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => controller.page = 2,
                child: SizedBox(
                  height: double.infinity,
                  width: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      controller.page == 2
                          ? Icon(
                              Icons.settings,
                              color: colors.secondary,
                              size: 35,
                            )
                          : Icon(
                              Icons.settings_outlined,
                              color: colors.onPrimary.withOpacity(0.7),
                              size: 35,
                            ),
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 12,
                          color: controller.page == 2
                              ? colors.onPrimary
                              : colors.onPrimary.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
