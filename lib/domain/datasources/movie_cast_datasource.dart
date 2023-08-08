import 'package:cinepedia/domain/entities/movie_cast.dart';

abstract class MovieCastDatasource {
  Future<List<Actor>> getCastByMovie(String movieId);
}
