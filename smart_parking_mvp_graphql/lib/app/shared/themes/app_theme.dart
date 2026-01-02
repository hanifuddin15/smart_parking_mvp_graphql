import 'package:flutter/material.dart';
import 'package:smart_parking_mvp_graphql/app/core/constants/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
    ),
    // Add other theme properties
  );
}
