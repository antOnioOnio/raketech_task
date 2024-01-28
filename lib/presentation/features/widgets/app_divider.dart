import 'package:flutter/material.dart';
import 'package:raketech_task/app/constants/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Divider(
      indent: 16.0,
      endIndent: 16.0,
      color: AppColors.softGrey,
    );
  }
}
