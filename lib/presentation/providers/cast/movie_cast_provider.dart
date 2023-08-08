import 'package:cinepedia/domain/domain.dart';
import 'package:cinepedia/presentation/providers/cast/movie_cast_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final castByMovieProvider =
    StateNotifierProvider<CastByMovieNotifier, Map<String, List<Actor>>>((ref) {
  final castRepository = ref.watch(movieCastRepositoryProvider);
  return CastByMovieNotifier(getCast: castRepository.getCastByMovie);
});

typedef GetCastCallBack = Future<List<Actor>> Function(String movieId);

class CastByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetCastCallBack getCast;

  CastByMovieNotifier({
    required this.getCast,
  }) : super({});

  Future<void> loadCast(String movieId) async {
    if (state[movieId] != null) return;
    final cast = await getCast(movieId);
    state = {...state, movieId: cast};
  }
}
