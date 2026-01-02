import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/routes/app_pages.dart';
import 'package:smart_parking_mvp_graphql/app/shared/themes/app_theme.dart';
import 'package:smart_parking_mvp_graphql/bootstrap.dart';

void main() async {
  await bootstrap();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
