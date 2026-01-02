import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/core/graphql/graphql_client.dart';
import 'package:smart_parking_mvp_graphql/app/data/datasources/graphql_datasource.dart';
import 'package:smart_parking_mvp_graphql/app/data/repositories/post_repository.dart';
import 'package:smart_parking_mvp_graphql/app/modules/post/controllers/post_controller.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    // If Client and Datasource are already put in main bindings or permanent, we can just find them.
    // Assuming we want to be safe and lazyPut everything if not present, but typically client is global.
    // For safety here within this scope:
    if (!Get.isRegistered<GraphqlClient>()) {
      Get.lazyPut(() => GraphqlClient());
    }
    if (!Get.isRegistered<GraphqlDatasource>()) {
      Get.lazyPut(() => GraphqlDatasource(Get.find()));
    }
    Get.lazyPut<PostRepository>(() => PostRepository(Get.find()));
    Get.lazyPut<PostController>(() => PostController(Get.find()));
  }
}
