import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/modules/auth/controllers/auth_controller.dart';
import 'package:smart_parking_mvp_graphql/app/shared/widgets/app_text_field.dart';
import 'package:smart_parking_mvp_graphql/app/shared/widgets/loading_widget.dart';
import 'package:smart_parking_mvp_graphql/app/shared/widgets/primary_button.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Obx(
        () => controller.isLoading.value
            ? const LoadingWidget()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextField(
                      controller: controller.nameController,
                      hintText: 'Name',
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: controller.emailController,
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: controller.passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),
                    PrimaryButton(
                      text: 'Register',
                      onPressed: controller.register,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
