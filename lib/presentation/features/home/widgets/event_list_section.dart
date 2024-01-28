import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raketech_task/app/constants/app_colors.dart';
import 'package:raketech_task/app/constants/app_fonts.dart';
import 'package:raketech_task/app/types/date_type.dart';
import 'package:raketech_task/app/types/screen_status.dart';
import 'package:raketech_task/presentation/features/home/bloc/home_bloc.dart';
import 'package:raketech_task/presentation/features/widgets/custom_circular_loader.dart';

class EventListSection extends StatelessWidget {
  final DateType dateType;

  const EventListSection({Key? key, required this.dateType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final eventList = state.getListByDate(dateType);
        final isLoading = state.screenStatus.isLoading();

        return isLoading
            ? const CustomCircularLoader()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: eventList.length,
                  itemBuilder: ((context, index) {
                    final event = eventList[index];

                    return Column(
                      children: [
                        ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          leading: Image.network(
                            event.iconUrl ?? '',
                            width: 46,
                            height: 46,
                          ),
                          title: Text(
                            '${dateType.name} | ${event.timeStarting}',
                            style: AppFonts.bodySdBold,
                          ),
                          subtitle: Text(
                            event.teams ?? '',
                            style: AppFonts.bodyMdBold,
                          ),
                          trailing: Container(
                            width: 54,
                            height: 54,
                            decoration: const BoxDecoration(
                              color: AppColors.complementary,
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(event.league ?? ''),
                              ],
                            ),
                          ),
                          onTap: () => DoNothingAction(),
                        ),
                        const Divider(
                          indent: 16.0,
                          endIndent: 16.0,
                          color: AppColors.softGrey,
                        ),
                      ],
                    );
                  }),
                ),
              );
      },
    );
  }
}
