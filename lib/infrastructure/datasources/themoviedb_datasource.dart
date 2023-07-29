import 'package:dio/dio.dart';

import 'package:cinepedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinepedia/infrastructure/models/themoviedb/themoviedb_response.dart';

import 'package:cinepedia/config/constants/enviroment.dart';
import 'package:cinepedia/domain/entities/movie.dart';
import 'package:cinepedia/domain/datasources/movie_datasource.dart';

class TheMoviedbDataSource extends MovieDataSource {
  final url = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDBKey,
        'language': 'es-AR',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await url.get('/movie/now_playing');
    final movieResponse = TheMovieDBResponse.fromJson(response.data);
    final List<Movie> movies = movieResponse.results
        .where((movie) => movie.posterPath != 'no-poster')
        .map((movie) => MovieMapper.movieDBToEntity(movie))
        .toList();

    return movies;
  }
}
