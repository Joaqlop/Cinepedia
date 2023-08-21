import 'package:cinepedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinepedia/domain/entities/movie.dart';
import 'package:cinepedia/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImp extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImp(this.datasource);

  @override
  Future<bool> isFavorite(int movieId) {
    return datasource.isToggled(movieId);
  }

  @override
  Future<List<Movie>> loadFavorites({int limit = 10, offset = 0}) {
    return datasource.loadFavorites(limit: limit, offset: offset);
  }

  @override
  Future<void> toggle(Movie movie) {
    return datasource.toggle(movie);
  }
}
