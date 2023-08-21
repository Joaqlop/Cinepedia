import 'package:cinepedia/config/config.dart';
import 'package:cinepedia/presentation/providers/providers.dart';
import 'package:cinepedia/presentation/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    if (favoriteMovies.isEmpty) {
      return Center(
        child: Text(
          'No hay favoritos para mostrar.',
          style: AppTextTheme.greyBodySmall,
        ),
      );
    }

    return MasonryView(
      loadNextPage: loadNextPage,
      movies: favoriteMovies,
    ).animate().moveY(begin: -10);
  }
}
