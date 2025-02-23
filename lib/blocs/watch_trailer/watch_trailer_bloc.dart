import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ten_twenty_test/models/movie.dart';
import 'package:ten_twenty_test/models/movie_trailer.dart';
import 'package:ten_twenty_test/services/api_services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
part 'watch_trailer_event.dart';
part 'watch_trailer_state.dart';

class WatchTrailerBloc extends Bloc<WatchTrailerEvent, WatchTrailerState> {
  YoutubePlayerController? controller;
  WatchTrailerBloc() : super(const WatchTrailerInitial()) {
    on<GetMoviesTrailersFromMoviesEvent>((event, emit) async {
      try {
        final s = state as WatchTrailerInitial;
        emit(s.copyWith(isLoading: true));
        final instance = APIServices.instance;
        final MovieTrailer trailer =
            await instance.getMovieVideos(event.movie.id);
        final youtubeVideos = trailer.results
            .where((e) => e.site.toLowerCase() == "YouTube".toLowerCase())
            .toList();
        controller = YoutubePlayerController(
          initialVideoId: youtubeVideos.first.key,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            showLiveFullscreenButton: false,
            enableCaption: false,
            hideControls: true,
            disableDragSeek: true,
            controlsVisibleAtStart: false,
            startAt: 0,
            mute: false,
          ),
        );
        controller!.play();
        emit(s.copyWith(
            isLoading: false, trailer: trailer, controller: controller));
      } catch (e) {
        final s = state as WatchTrailerInitial;
        emit(s.copyWith(
            isLoading: true, hasError: true, errorMessage: e.toString()));
        log("Error getting trailers : $e");
      }
    });
    // on<WatchTrailerEvent>((event, emit) {});
    // on<WatchTrailerEvent>((event, emit) {});
    // on<WatchTrailerEvent>((event, emit) {});
  }

  @override
  Future<void> close() {
    controller?.dispose();
    return super.close();
  }
}
