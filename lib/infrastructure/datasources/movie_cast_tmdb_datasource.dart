import 'package:cinepedia/config/config.dart';
import 'package:cinepedia/domain/datasources/movie_cast_datasource.dart';
import 'package:cinepedia/domain/entities/movie_cast.dart';
import 'package:cinepedia/infrastructure/mappers/movie_cast_mapper.dart';
import 'package:cinepedia/infrastructure/models/themoviedb/movie_credits_themoviedb_response.dart';
import 'package:dio/dio.dart';

class MovieCastTMDBDatasource extends MovieCastDatasource {
  final url = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDBKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Actor>> getCastByMovie(String movieId) async {
    final response = await url.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> movieCast = castResponse.cast
        .map((cast) => MovieCastMapper.movieCastToEntity(cast))
        .toList();

    return movieCast;
  }
}
