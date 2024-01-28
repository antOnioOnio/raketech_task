import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raketech_task/app/types/date_type.dart';
import 'package:raketech_task/app/types/screen_status.dart';
import 'package:raketech_task/domain/models/event_entity.dart';
import 'package:raketech_task/presentation/features/home/bloc/home_bloc.dart';
import 'package:raketech_task/presentation/features/home/widgets/event_details.dart';
import 'package:raketech_task/presentation/features/home/widgets/event_list_section.dart';
import 'package:raketech_task/presentation/features/widgets/custom_circular_loader.dart';

class HomeBody extends StatelessWidget {
  final DateType dateType;

  const HomeBody({Key? key, required this.dateType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final eventList = state.getListByDate(dateType);
        final isLoading = state.screenStatus.isLoading();
        final isEventSelected = state.getEventSelectedForDate(dateType) != null;

        return isLoading
                ? const CustomCircularLoader()
                : AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(isEventSelected ? 1.0 : -1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    }, // Animation duration
                    child: isEventSelected
                        ? EventDetails(
                            event: state.getEventSelectedForDate(dateType) ??
                                const EventEntity(),
                            dateType: dateType,
                          )
                        : EvenListSection(
                            eventList: eventList, dateType: dateType),
                  ) /* isEventSelected
                ? EventDetails(
                    event: state.eventSelected ?? const EventEntity(),
                  )
                : EvenListSection(eventList: eventList, dateType: dateType)*/
            ;
      },
    );
  }
}
