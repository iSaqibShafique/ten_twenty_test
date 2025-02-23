import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty_test/blocs/dashboard/dashboard_bloc.dart';
import 'package:ten_twenty_test/screens/bottom_nav_screens/dashboard/main_dashboard_view.dart';
import 'package:ten_twenty_test/screens/bottom_nav_screens/media_library/main_media_libraray.dart';
import 'package:ten_twenty_test/screens/bottom_nav_screens/more/main_more_view.dart';
import 'package:ten_twenty_test/screens/bottom_nav_screens/watch/watch_main_view.dart';
import 'package:ten_twenty_test/widgets/k_bottom_nav.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final List<Widget> bodyWidgets = const [
    MainDashboardView(),
    MainWatchView(),
    MainMediaLibrarayView(),
    MainMoreView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const KBottomNav(),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return state is DashboardInitial
              ? IndexedStack(
                  index: state.selectedIndex,
                  children: bodyWidgets,
                )
              : const SizedBox();
        },
      ),
    );
  }
}
