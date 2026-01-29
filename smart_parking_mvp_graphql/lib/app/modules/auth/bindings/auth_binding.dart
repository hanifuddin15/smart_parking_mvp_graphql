import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/modules/auth/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(Get.find()));
  }
}
