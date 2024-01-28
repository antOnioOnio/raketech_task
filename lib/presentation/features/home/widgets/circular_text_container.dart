import 'package:flutter/material.dart';
import 'package:raketech_task/app/constants/app_colors.dart';

class CircularTextContainer extends StatelessWidget {
  final String text;

  const CircularTextContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: const BoxDecoration(
        color: AppColors.complementary,
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
        ],
      ),
    );
  }
}
