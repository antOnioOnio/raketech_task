import 'package:flutter/material.dart';
import 'package:raketech_task/app/constants/app_colors.dart';
import 'package:raketech_task/app/constants/app_fonts.dart';

class EventListSection extends StatelessWidget {
  const EventListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: 4,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
                  width: 46,
                  height: 46,
                ),
                title: const Text(
                  'Today | 12:45 - 14:45',
                  style: AppFonts.bodySdBold,
                ),
                subtitle: const Text(
                  'Milan vs Munich',
                  style: AppFonts.bodyMdBold,
                ),
                trailing: Container(
                  width: 54,
                  height: 54,
                  decoration: const BoxDecoration(
                    color: AppColors.complementary,
                    shape: BoxShape.circle,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Lega'),
                      Text('B'),
                    ],
                  ),
                ),
                onTap: () => DoNothingAction(),
              ),
              const Divider(
                indent: 16.0,
                endIndent: 16,
                color: AppColors.softGrey,
              ),
            ],
          );
        }),
      ),
    );
  }
}
