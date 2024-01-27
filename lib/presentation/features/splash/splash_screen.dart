import 'package:flutter/material.dart';
import 'package:raketech_task/app/constants/app_colors.dart';

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
              'Raketech Template',
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
