import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/core/graphql/graphql_client.dart';
import 'package:smart_parking_mvp_graphql/app/data/datasources/graphql_datasource.dart';
import 'package:smart_parking_mvp_graphql/app/data/repositories/auth_repository.dart';
import 'package:smart_parking_mvp_graphql/app/modules/auth/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GraphqlClient>(() => GraphqlClient());
    Get.lazyPut<GraphqlDatasource>(() => GraphqlDatasource(Get.find()));
    Get.lazyPut<AuthRepository>(() => AuthRepository(Get.find()));
    Get.lazyPut<AuthController>(() => AuthController(Get.find()));
  }
}
