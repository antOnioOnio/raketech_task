import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raketech_task/app/constants/app_assets.dart';
import 'package:raketech_task/app/constants/app_colors.dart';
import 'package:raketech_task/app/constants/app_fonts.dart';
import 'package:raketech_task/app/extensions/context_extensions.dart';
import 'package:raketech_task/presentation/features/home/widgets/event_list_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: AppColors.primaryWhite,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: SvgPicture.asset(
            AppAssets.appLogo,
            height: 44,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 28,
              child: TabBar(
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
                      context.localizations.yesterday_text.toUpperCase(),
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
            Expanded(
              child: TabBarView(
                children: [
                  EventListSection(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
