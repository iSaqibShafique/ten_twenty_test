import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ten_twenty_test/models/movie.dart';
import 'package:ten_twenty_test/models/upcoming_movies.dart';
import 'package:ten_twenty_test/services/api_services.dart';
part 'main_watch_event.dart';
part 'main_watch_state.dart';

class MainWatchBloc extends Bloc<MainWatchEvent, MainWatchState> {
  MainWatchBloc() : super(const MainWatchInitial()) {
    on<AddOrRemoveUserToSearchState>((event, emit) {
      final s = state as MainWatchInitial;
      final bool isUserInSearchState = s.userInSearchState;
      emit(s.copyWith(userInSearchState: !isUserInSearchState));
    });
    on<GetUpcomingMoviesEvent>((event, emit) async {
      try {
        final s = state as MainWatchInitial;
        emit(s.copyWith(isLoading: true));
        final instance = APIServices.instance;
        final movies = await instance.getUpcomingMovies();
        emit(s.copyWith(isLoading: false, movies: movies));
      } catch (e) {
        final s = state as MainWatchInitial;
        emit(s.copyWith(hasError: true, errorMessage: e.toString()));
      }
    });
    on<OnSearchMoviesEvent>((event, emit) {
      final s = state as MainWatchInitial;
      if (event.query.trim().isEmpty) {
        emit(s.copyWith(userSearchingMovies: false, searchedMovies: []));
      } else {
        emit(s.copyWith(userSearchingMovies: true));
        final List<Movie> movies = s.movies?.results ?? [];
        final filteredMovies = movies
            .where((movie) =>
                movie.title.toLowerCase().contains(event.query.toLowerCase()))
            .toList();
        emit(s.copyWith(
            searchedMovies: filteredMovies, userSearchingMovies: true));
      }
    });
    on<OnEndSearchMoviesEvent>((event, emit) {
      final s = state as MainWatchInitial;
      emit(s.copyWith(userSearchingMovies: false, searchedMovies: []));
    });
    // on<ListenToYotubePlayerEvent>((event, emit) {});
    // on<MainWatchEvent>((event, emit) {});
  }
}
