import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raketech_task/app/constants/app_assets.dart';
import 'package:raketech_task/app/constants/app_colors.dart';
import 'package:raketech_task/app/constants/app_fonts.dart';
import 'package:raketech_task/app/extensions/context_extensions.dart';
import 'package:raketech_task/app/types/date_type.dart';
import 'package:raketech_task/domain/models/event_entity.dart';
import 'package:raketech_task/presentation/features/home/bloc/home_bloc.dart';
import 'package:raketech_task/presentation/features/home/widgets/circular_text_container.dart';
import 'package:raketech_task/presentation/features/widgets/app_divider.dart';

class EventDetails extends StatelessWidget {
  final EventEntity event;
  final DateType dateType;

  const EventDetails({Key? key, required this.event, required this.dateType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => context.read<HomeBloc>().add(
                    HomeEvent.updateEventSelected(
                      event: null,
                      dateType: dateType,
                    ),
                  ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.goBackIcon,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    context.localizations.get_back_text,
                    style: AppFonts.heading3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 24.0),
              child: CircularTextContainer(text: event.league ?? ''),
            ),
            Text(
              '${dateType.name} | ${event.timeStarting}',
              style: AppFonts.bodySdBold,
            ),
            Text(
              event.teams ?? '',
              style: AppFonts.bodyMdBold,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 24.0),
              child: AppDivider(),
            ),
            Image.network(
              event.iconUrl ?? '',
              width: 46,
              height: 46,
            ),
          ],
        ),
      ),
    );
  }
}
