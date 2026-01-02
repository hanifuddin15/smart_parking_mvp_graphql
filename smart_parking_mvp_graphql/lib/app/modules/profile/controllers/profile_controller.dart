import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/routes/app_routes.dart';

class ProfileController extends GetxController {
  void logout() {
    // Clear tokens logic here
    Get.offAllNamed(Routes.LOGIN);
  }
}
