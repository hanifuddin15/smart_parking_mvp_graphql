import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/core/graphql/graphql_client.dart';
import 'package:smart_parking_mvp_graphql/app/core/graphql/graphql_config.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GraphQL Client
  Get.put(GraphqlClient().initialize(baseUrl: GraphqlConfig.baseUrl));
}
