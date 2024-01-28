import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raketech_task/app/constants/app_fonts.dart';
import 'package:raketech_task/app/types/date_type.dart';
import 'package:raketech_task/domain/models/event_entity.dart';
import 'package:raketech_task/presentation/features/home/bloc/home_bloc.dart';
import 'package:raketech_task/presentation/features/home/widgets/circular_text_container.dart';
import 'package:raketech_task/presentation/features/widgets/app_divider.dart';

class EvenListSection extends StatelessWidget {
  final List<EventEntity> eventList;
  final DateType dateType;

  const EvenListSection({
    Key? key,
    required this.eventList,
    required this.dateType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
                trailing: CircularTextContainer(text: event.league ?? ''),
                onTap: () => context.read<HomeBloc>().add(
                      HomeEvent.updateEventSelected(
                        event: event,
                        dateType: dateType,
                      ),
                    ),
              ),
              const AppDivider(),
            ],
          );
        }),
      ),
    );
  }
}
