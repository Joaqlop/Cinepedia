import 'package:cinepedia/domain/entities/movie_cast.dart';

abstract class MovieCastRepository {
  Future<List<Actor>> getCastByMovie(String movieId);
}
