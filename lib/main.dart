import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:raketech_task/app/config/app_theme.dart';
import 'package:raketech_task/app/di/di.dart' as app_di;
import 'package:raketech_task/app/di/top_bloc_provider.dart';
import 'package:raketech_task/presentation/features/splash/splash_controller.dart';
import 'package:raketech_task/presentation/top_blocs/language_bloc/language_bloc.dart';
import 'package:raketech_task/presentation/top_blocs/language_bloc/language_bloc_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  app_di.initDi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return TopBlocProviders(
      child: BlocBuilder<LanguagesBloc, LanguageBlocState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.myTheme,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: state.locale,
            supportedLocales: const [
              Locale('es', ''),
              Locale('en', ''),
            ],
            home: SplashController(),
          );
        },
      ),
    );
  }
}
