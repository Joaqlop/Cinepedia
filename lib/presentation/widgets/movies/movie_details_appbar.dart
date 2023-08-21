import 'package:cinepedia/presentation/widgets/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinepedia/presentation/providers/providers.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:cinepedia/config/config.dart';
import 'package:cinepedia/domain/entities/movie.dart';

final isToggledProvider = FutureProvider.family.autoDispose((ref, int movieId) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return localStorageRepository.isFavorite(movieId);
});

class MovieDetailAppBar extends ConsumerWidget {
  final Movie movie;
  const MovieDetailAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context, ref) {
    final isToggled = ref.watch(isToggledProvider(movie.id));
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: AppColor.vulcan,
      foregroundColor: Colors.white,
      expandedHeight: size.height * 0.65,
      floating: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: isToggled.when(
            loading: () => const Loader(),
            data: (isFavorite) => isFavorite
                ? const Icon(Icons.favorite).animate().shake()
                : const Icon(Icons.favorite_border_outlined),
            error: (_, __) => throw UnimplementedError(),
          ),
          onPressed: () async {
            await ref
                .read(favoriteMoviesProvider.notifier)
                .toggleFavorite(movie);

            ref.invalidate(isToggledProvider(movie.id));
          },
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          children: [
            SizedBox.expand(
              child: movie.posterPath != ''
                  ? Image.network(
                      movie.posterPath,
                      fit: BoxFit.cover,
                    ).animate().fadeIn(duration: 700.ms)
                  : Container(color: Colors.black),
            ),
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.3, 0.7, 1],
                    colors: [
                      Colors.black38,
                      Colors.transparent,
                      AppColor.vulcan,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
