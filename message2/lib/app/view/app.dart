import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/l10n/l10n.dart';
import 'package:message2/navigation/cubit/navigation_cubit.dart';
import 'package:message2/routers/go_routers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (_) => NavigationCubit(),
        )
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          foregroundColor: AppColors.blackColor,
          shadowColor: Colors.transparent,
        ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: AppColors.primaryColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppFontSize.sm),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: AppFontSize.xlg,
            ),
            splashFactory: NoSplash.splashFactory,
            shadowColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            shadowColor: Colors.transparent,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: MyRouter.instance,
      builder: (context, child) {
        return child!;
      },
    );
  }
}
