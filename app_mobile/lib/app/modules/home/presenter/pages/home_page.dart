import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/buttom_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<HomeController>();

  final List<Widget> _pages = <Widget>[
    const Scaffold(backgroundColor: Colors.blue),
    const Scaffold(backgroundColor: Colors.amber),
    const Scaffold(backgroundColor: Colors.pink),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      bottomNavigationBar: ButtomBarWidget(),
      extendBody: true,
      body: Obx(() {
        return Center(
          child: _pages[controller.page],
        );
      }),
    );
  }
}