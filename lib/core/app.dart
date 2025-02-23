import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty_test/blocs/dashboard/dashboard_bloc.dart';
import 'package:ten_twenty_test/blocs/main_watch/main_watch_bloc.dart';
import 'package:ten_twenty_test/blocs/watch_trailer/watch_trailer_bloc.dart';
import 'package:ten_twenty_test/routes/app_routes.dart';
import 'package:ten_twenty_test/styles/app_colors.dart';
import 'package:ten_twenty_test/styles/typography.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DashboardBloc()),
        BlocProvider(create: (context) => MainWatchBloc()),
        BlocProvider(create: (context) => WatchTrailerBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.instance.router,
        theme: ThemeData.light().copyWith(
          textButtonTheme: TextButtonThemeData(
            style: const ButtonStyle().copyWith(
              iconColor: const WidgetStatePropertyAll(Colors.white),
              backgroundColor: WidgetStatePropertyAll(AppColors.primary),
              minimumSize:
                  const WidgetStatePropertyAll(Size(double.infinity, 50)),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              foregroundColor: const WidgetStatePropertyAll(Colors.white),
              textStyle: WidgetStatePropertyAll(kStyle14600),
              side: WidgetStatePropertyAll(
                BorderSide(color: AppColors.primary, width: 1),
              ),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: const ButtonStyle().copyWith(
              backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
              foregroundColor: const WidgetStatePropertyAll(Colors.white),
              textStyle: WidgetStatePropertyAll(kStyle16500),
              side: const WidgetStatePropertyAll(BorderSide.none),
            ),
          ),
          chipTheme: const ChipThemeData().copyWith(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            labelStyle: kStyle12600.copyWith(color: Colors.white),
            side: BorderSide.none,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          ),
          scaffoldBackgroundColor: AppColors.scaffoldBackground,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: AppColors.textInputBordered,
              ),
            ),
            filled: true,
            hintStyle: kStyle14400.copyWith(color: AppColors.textInputHint),
            fillColor: AppColors.textInputFilledForeground,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: AppColors.textInputBordered,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: AppColors.textInputBordered,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: AppColors.textInputBordered,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: AppColors.textInputBordered,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
