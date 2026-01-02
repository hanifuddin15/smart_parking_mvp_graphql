import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/modules/home/controllers/home_controller.dart';
import 'package:smart_parking_mvp_graphql/app/routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome Home'),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.POSTS),
              child: const Text('View Posts'),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.PROFILE),
              child: const Text('View Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
