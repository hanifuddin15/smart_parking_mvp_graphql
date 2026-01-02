import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/data/repositories/auth_repository.dart';
import 'package:smart_parking_mvp_graphql/app/routes/app_routes.dart';

class AuthController extends GetxController {
  final AuthRepository _repository;
  AuthController(this._repository);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final RxBool isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    try {
      await _repository.login(emailController.text, passwordController.text);
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register() async {
    isLoading.value = true;
    try {
      await _repository.register(
        nameController.text,
        emailController.text,
        passwordController.text,
      );
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
