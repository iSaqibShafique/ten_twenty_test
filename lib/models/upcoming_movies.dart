import 'package:ten_twenty_test/models/dates.dart';
import 'package:ten_twenty_test/models/movie.dart';

class UpcomingMovies {
  final Dates dates;
  final int page;
  final List<Movie> results;
  UpcomingMovies({
    required this.dates,
    required this.page,
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dates': dates.toMap(),
      'page': page,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory UpcomingMovies.fromMap(Map<String, dynamic> map) {
    return UpcomingMovies(
      dates: Dates.fromMap(map['dates'] as Map<String, dynamic>),
      page: map['page'] as int,
      results: List<Movie>.from(
        (map['results']).map<Movie>(
          (x) => Movie.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
