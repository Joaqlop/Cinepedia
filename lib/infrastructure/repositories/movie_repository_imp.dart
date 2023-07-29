import 'package:cinepedia/domain/datasources/movie_datasource.dart';
import 'package:cinepedia/domain/entities/movie.dart';
import 'package:cinepedia/domain/repositories/movie_repository.dart';

class MovieRepositoryImp extends MovieRepository {
  final MovieDataSource dataSource;

  MovieRepositoryImp(this.dataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }
}
