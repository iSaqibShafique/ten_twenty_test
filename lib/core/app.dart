import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty_test/blocs/dashboard/dashboard_bloc.dart';
import 'package:ten_twenty_test/blocs/main_watch/main_watch_bloc.dart';
import 'package:ten_twenty_test/blocs/watch_trailer/watch_trailer_bloc.dart';
import 'package:ten_twenty_test/routes/app_routes.dart';
import 'package:ten_twenty_test/styles/light_theme.dart';

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
        theme: lightTheme,
        highContrastTheme: lightTheme,
      ),
    );
  }
}
