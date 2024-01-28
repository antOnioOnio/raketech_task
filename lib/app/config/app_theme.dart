import 'package:flutter/material.dart';
import 'package:raketech_task/app/constants/app_colors.dart';

abstract class AppTheme {
  static final ThemeData myTheme = ThemeData(
    primarySwatch: AppColors.getMaterialColor(AppColors.primary),
    /*  indicatorColor:  AppColors.getMaterialColor(AppColors.secondary),*/
    fontFamily: 'Inter',
  );
}
