import 'package:go_router/go_router.dart';
import 'package:ten_twenty_test/screens/bottom_nav_screens/watch/watch_a_movie_details_view.dart';
import 'package:ten_twenty_test/screens/bottom_nav_screens/watch/watch_trailer_view.dart';
import 'package:ten_twenty_test/screens/dashboard/dashboard_view.dart';
import 'transition.dart';

class AppRoutes {
  AppRoutes._();

  static final instance = AppRoutes._();

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: NamedRoutes.dashboard.name,
        pageBuilder: (context, state) {
          return buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const DashboardView(),
          );
        },
      ),
      GoRoute(
        path: "/watch-movies-details-view",
        name: NamedRoutes.watchAMovieDetailsView.name,
        pageBuilder: (context, state) {
          return buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const WatchAMovieDetailsView(),
          );
        },
      ),
      GoRoute(
        path: "/watch-trailer-view",
        name: NamedRoutes.watchTraillerView.name,
        pageBuilder: (context, state) {
          return buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const WatchTrailerView(),
          );
        },
      )
    ],
  );
}

enum NamedRoutes {
  dashboard,
  watchAMovieDetailsView,
  watchTraillerView,
}
