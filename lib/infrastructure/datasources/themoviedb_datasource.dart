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
    final response = await url.get('/movie/now_playing', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await url.get('/trending/movie/week', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await url.get('/movie/upcoming', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await url.get('/movie/top_rated', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieResponse = TheMovieDBResponse.fromJson(json);
    final List<Movie> movies = movieResponse.results
        .where((movie) => movie.posterPath != 'no-poster')
        .map((movie) => MovieMapper.movieDBToEntity(movie))
        .toList();

    return movies;
  }
}
