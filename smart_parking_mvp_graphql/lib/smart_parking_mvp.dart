import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:smart_parking_mvp_graphql/app/routes/app_pages.dart';
import 'package:smart_parking_mvp_graphql/app/shared/themes/app_theme.dart';

class SmartParkingMvp extends StatelessWidget {
  const SmartParkingMvp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Parking MVP',
      theme: AppTheme.lightTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}