import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/routes/app_pages.dart';
import 'package:smart_parking_mvp_graphql/app/routes/app_routes.dart';
import 'package:smart_parking_mvp_graphql/app/shared/themes/app_theme.dart';
import 'package:smart_parking_mvp_graphql/app/data/services/cache_service.dart';

class SmartParkingMvp extends StatelessWidget {
  const SmartParkingMvp({super.key});

  @override
  Widget build(BuildContext context) {
    final cacheService = Get.find<CacheService>();
    final initialRoute = cacheService.isLoggedIn ? Routes.HOME : AppPages.INITIAL;

    return GetMaterialApp(
      title: 'Smart Parking MVP',
      theme: AppTheme.lightTheme,
      initialRoute: initialRoute,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}