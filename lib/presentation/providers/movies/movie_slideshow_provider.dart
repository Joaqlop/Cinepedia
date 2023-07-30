import 'package:cinepedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinepedia/presentation/providers/providers.dart';

final movieSlideshowProvider = Provider<List<Movie>>((ref) {
  final topRatedMovies = ref.watch(topRatedMoviesProvider);

  if (topRatedMovies.isEmpty) return [];

  return topRatedMovies.sublist(0, 20);
});
