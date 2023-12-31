import 'package:cinepedia/config/config.dart';
import 'package:cinepedia/presentation/providers/providers.dart';
import 'package:cinepedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final slideShowMovies = ref.watch(movieSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final loading = ref.watch(initialLoadingProvider);
    if (loading) return const Loader();

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: AppColor.vulcan,
          flexibleSpace: const FlexibleSpaceBar(
            titlePadding: EdgeInsets.symmetric(horizontal: 10),
            title: CustomAppBar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  SlideShow(movies: slideShowMovies),
                  const SizedBox(height: 15),
                  MovieHorizontalListView(
                    movies: nowPlayingMovies.sublist(0, 15),
                    title: 'En cines',
                    subtitle: Helper.getToday(DateTime.now()),
                    loadNextPage: () =>
                        ref.read(nowPlayingMoviesProvider.notifier),
                  ),
                  MovieHorizontalListView(
                    movies: popularMovies,
                    title: 'Populares',
                    subtitle: Helper.getThisMonth(DateTime.now()),
                    loadNextPage: () =>
                        ref.read(popularMoviesProvider.notifier).loadNextPage(),
                  ),
                  MovieHorizontalListView(
                    movies: upcomingMovies,
                    title: 'Proximamente',
                    loadNextPage: () => ref
                        .read(upcomingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  const SizedBox(height: 15),
                ],
              );
            },
            childCount: 1,
          ),
        )
      ],
    );
  }
}
