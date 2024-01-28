import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raketech_task/presentation/features/home/home_screen.dart';
import 'package:raketech_task/presentation/features/splash/splash_bloc/splash_bloc.dart';
import 'package:raketech_task/presentation/features/splash/splash_bloc/splash_state.dart';
import 'package:raketech_task/presentation/features/splash/splash_screen.dart';

class SplashController extends StatelessWidget {
  const SplashController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.isSplashed()) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const HomeScreen(),
            fullscreenDialog: true, // avoid swipe back
          ));
        }
      },
      builder: (context, state) {
        return const SplashScreen();
      },
    );
  }
}
