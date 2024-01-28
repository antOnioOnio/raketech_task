import 'package:flutter/material.dart';
import 'package:raketech_task/app/constants/app_colors.dart';

class CustomCircularLoader extends StatelessWidget {
  const CustomCircularLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 35,
        width: 35,
        child: CircularProgressIndicator(
          color: AppColors.primary,
          backgroundColor: AppColors.complementary,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
