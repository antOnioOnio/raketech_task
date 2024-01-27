import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raketech_task/app/constants/app_assets.dart';
import 'package:raketech_task/app/constants/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            SvgPicture.asset(
              AppAssets.appLogo,
              width: 100,
              height: 100,
            ),
            const Divider(
              color: Colors.white,
              endIndent: 15,
              indent: 15,
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
