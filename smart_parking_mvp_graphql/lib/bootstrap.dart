import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/core/graphql/graphql_client.dart';
import 'package:smart_parking_mvp_graphql/app/core/graphql/graphql_config.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_parking_mvp_graphql/app/data/services/cache_service.dart';
import 'package:smart_parking_mvp_graphql/app/data/datasources/graphql_datasource.dart';
import 'package:smart_parking_mvp_graphql/app/data/repositories/auth_repository.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final cacheService = Get.put(CacheService());

  // Initialize GraphQL Client
  final graphqlClient = Get.put(GraphqlClient().initialize(baseUrl: GraphqlConfig.baseUrl));
  
  if (cacheService.isLoggedIn) {
     final token = cacheService.getAccessToken();
     if (token != null) {
        graphqlClient.setAuthHeader(token);
     }
  }

  Get.put(GraphqlDatasource(graphqlClient));
  Get.put(AuthRepository(Get.find(), cacheService));
}
