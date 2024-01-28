import 'package:flutter/material.dart';
import 'package:raketech_task/app/constants/app_colors.dart';
import 'package:raketech_task/app/constants/app_constants.dart';
import 'package:raketech_task/app/constants/app_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Text(
              AppConstants.appName,
              style: AppFonts.heading1white,
            ),
            Divider(
              color: Colors.white,
              endIndent: 15,
              indent: 15,
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
