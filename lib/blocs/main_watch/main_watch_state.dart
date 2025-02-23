part of 'main_watch_bloc.dart';

sealed class MainWatchState extends Equatable {
  const MainWatchState();

  @override
  List<Object> get props => [];
}

final class MainWatchInitial extends MainWatchState {
  final bool userInSearchState;
  final bool isLoading;
  final UpcomingMovies? movies;
  final bool hasError;
  final String errorMessage;
  final bool userSearchingMovies;
  final List<Movie> searchedMovies;

  const MainWatchInitial({
    this.userInSearchState = false,
    this.isLoading = false,
    this.movies,
    this.hasError = false,
    this.errorMessage = '',
    this.userSearchingMovies = false,
    this.searchedMovies = const [],
  });

  @override
  List<Object> get props => [
        userInSearchState,
        isLoading,
        movies ?? Object(),
        hasError,
        errorMessage,
        userSearchingMovies,
        searchedMovies,
      ];

  MainWatchInitial copyWith({
    bool? userInSearchState,
    bool? isLoading,
    UpcomingMovies? movies,
    bool? hasError,
    String? errorMessage,
    bool? userSearchingMovies,
    List<Movie>? searchedMovies,
  }) {
    return MainWatchInitial(
      userInSearchState: userInSearchState ?? this.userInSearchState,
      isLoading: isLoading ?? this.isLoading,
      movies: movies ?? this.movies,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      userSearchingMovies: userSearchingMovies ?? this.userSearchingMovies,
      searchedMovies: searchedMovies ?? this.searchedMovies,
    );
  }
}
