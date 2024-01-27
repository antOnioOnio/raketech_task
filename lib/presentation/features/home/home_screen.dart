import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raketech_task/app/constants/app_assets.dart';
import 'package:raketech_task/app/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
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
            TabBar(
              /*          labelStyle: AFTheme.of(context).typoOnLight.bodyMdBold,
            unselectedLabelStyle: AFTheme.of(context).typoOnLight.bodyMdBold,*/
              labelColor: AppColors.complementary,
              unselectedLabelColor: AppColors.disableBlack,
              tabs: [
                Tab(
                  child: Text('YESTERDAY'),
                ),
                Tab(
                  child: Text('TODAY'),
                ),
                Tab(
                  child: Text('TOMORROW'),
                ),
              ],
              onTap: (newTabIndex) => DoNothingAction(),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    color: Colors.pinkAccent,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
