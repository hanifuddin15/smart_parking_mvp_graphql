import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/routes/app_pages.dart';
import 'package:smart_parking_mvp_graphql/app/shared/themes/app_theme.dart';
import 'package:smart_parking_mvp_graphql/bootstrap.dart';
import 'package:smart_parking_mvp_graphql/smart_parking_mvp.dart';

void main() async {
  await bootstrap();
  runApp(const SmartParkingMvp());
}

