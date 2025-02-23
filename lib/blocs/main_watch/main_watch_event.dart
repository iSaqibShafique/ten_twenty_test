part of 'main_watch_bloc.dart';

sealed class MainWatchEvent extends Equatable {
  const MainWatchEvent();

  @override
  List<Object> get props => [];
}

final class AddOrRemoveUserToSearchState extends MainWatchEvent {}

final class GetUpcomingMoviesEvent extends MainWatchEvent {}

final class OnSearchMoviesEvent extends MainWatchEvent {
  final String query;

  const OnSearchMoviesEvent(this.query);
}

final class OnEndSearchMoviesEvent extends MainWatchEvent {}
