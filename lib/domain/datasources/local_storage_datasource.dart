import 'package:cinepedia/domain/entities/movie.dart';

abstract class LocalStorageDatasource {
  Future<void> toggle(Movie movie);

  Future<bool> isToggled(int movieId);

  Future<List<Movie>> loadFavorites({int limit = 10, offset = 0});
}
