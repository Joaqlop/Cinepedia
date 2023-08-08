import 'package:cinepedia/domain/domain.dart';

class MovieCastRepositoryImp extends MovieCastRepository {
  final MovieCastDatasource datasource;

  MovieCastRepositoryImp(this.datasource);

  @override
  Future<List<Actor>> getCastByMovie(String movieId) async {
    return datasource.getCastByMovie(movieId);
  }
}
