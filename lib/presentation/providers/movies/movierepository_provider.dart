import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinepedia/infrastructure/datasources/themoviedb_datasource.dart';
import 'package:cinepedia/infrastructure/repositories/movie_repository_imp.dart';

//inmutable repository
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImp(TheMoviedbDataSource());
});
