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
            if (controller.user != null)
              Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      if (controller.user!.profileImage.isNotEmpty)
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(controller.user!.profileImage),
                        ),
                      const SizedBox(height: 10),
                      Text('Name: ${controller.user!.name}', style: Get.textTheme.titleLarge),
                      Text('Email: ${controller.user!.email}', style: Get.textTheme.bodyMedium),
                      Text('Phone: ${controller.user!.phone}', style: Get.textTheme.bodyMedium),
                    ],
                  ),
                ),
              ),
            const Text('Welcome Home'),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.POSTS),
              child: const Text('View Posts'),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.PROFILE),
              child: const Text('View Profile'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: controller.logout,
              child: const Text('Logout', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
