import 'package:get/get.dart';

import 'package:smart_parking_mvp_graphql/app/data/models/user_model.dart';
import 'package:smart_parking_mvp_graphql/app/data/repositories/auth_repository.dart';
import 'package:smart_parking_mvp_graphql/app/routes/app_routes.dart';

class HomeController extends GetxController {
  final AuthRepository _authRepository = Get.find<AuthRepository>();

  UserModel? get user => _authRepository.currentUser;

  Future<void> logout() async {
    await _authRepository.logout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
