import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raketech_task/app/constants/app_assets.dart';
import 'package:raketech_task/app/constants/app_colors.dart';
import 'package:raketech_task/app/types/date_type.dart';
import 'package:raketech_task/presentation/features/home/bloc/home_bloc.dart';
import 'package:raketech_task/presentation/features/home/widgets/home_body.dart';
import 'package:raketech_task/presentation/features/home/widgets/tab_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 1,
      length: 3,
      vsync: this,
    );
    tabController.addListener(_handleSelected);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: PopScope(
        onPopInvoked: (_) => false,
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
              HomeTabBar(controller: tabController),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    HomeBody(dateType: DateType.yesterday()),
                    HomeBody(dateType: DateType.today()),
                    HomeBody(dateType: DateType.tomorrow()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSelected() {
    context.read<HomeBloc>().add(
          HomeEvent.fetchEventsByDate(
            DateType.fromInt(tabController.index),
          ),
        );
  }
}
