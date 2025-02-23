import 'package:dio/dio.dart';
import 'package:ten_twenty_test/models/movie_trailer.dart';
import 'package:ten_twenty_test/models/upcoming_movies.dart';

class APIServices {
  APIServices._() {
    initDio();
  }
  static final instance = APIServices._();

  final String baseURL = "https://api.themoviedb.org/3/";
  final String apiKey = "27c2b835a7a5a46aaf538d87c13feefb";
  final Dio dio = Dio();

  Future<void> initDio() async {
    dio.options = BaseOptions(
      baseUrl: baseURL,
      connectTimeout: const Duration(seconds: 60),
      queryParameters: {
        "api_key": apiKey,
      },
    );
  }

  // Fetch upcoming movies
  Future<UpcomingMovies> getUpcomingMovies() async {
    final response = await dio.get("movie/upcoming");
    UpcomingMovies movies = UpcomingMovies.fromMap(response.data);
    return movies;
  }

  Future<void> getMovieDetails(int movieId) async {
    await dio.get("movie/$movieId");
  }

  Future<MovieTrailer> getMovieVideos(int movieId) async {
    final response = await dio.get("movie/$movieId/videos", queryParameters: {
      "language": "en-US",
    });
    return MovieTrailer.fromMap(response.data);
  }
}
