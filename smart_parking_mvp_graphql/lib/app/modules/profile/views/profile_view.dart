import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/modules/profile/controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: ElevatedButton(
          onPressed: controller.logout,
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
