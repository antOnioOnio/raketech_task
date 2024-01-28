import 'package:flutter/material.dart';
import 'package:raketech_task/app/constants/app_colors.dart';
import 'package:raketech_task/app/constants/app_fonts.dart';
import 'package:raketech_task/app/extensions/context_extensions.dart';

class HomeTabBar extends StatelessWidget {
  final TabController controller;
  const HomeTabBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: double.infinity,
      color: AppColors.primary200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 28,
            child: TabBar(
              controller: controller,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.transparent,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2,
                  color: AppColors.secondary,
                ),
              ),
              padding: EdgeInsets.zero,
              labelStyle: AppFonts.heading2,
              tabAlignment: TabAlignment.center,
              labelColor: AppColors.secondary,
              unselectedLabelColor: AppColors.naturalGrey,
              dividerColor: Colors.transparent,
              tabs: [
                Tab(
                  child: Text(
                    context.localizations.yesterday_text
                        .toUpperCase(),
                  ),
                ),
                Tab(
                  child: Text(
                    context.localizations.today_text.toUpperCase(),
                  ),
                ),
                Tab(
                  child: Text(
                    context.localizations.tomorrow_text.toUpperCase(),
                  ),
                ),
              ],
              onTap: (newTabIndex) => DoNothingAction(),
            ),
          ),
        ],
      ),
    );
  }
}
