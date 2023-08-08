import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinepedia/config/config.dart';

import 'package:cinepedia/domain/entities/movie.dart';
import 'package:cinepedia/presentation/providers/providers.dart';
import 'package:cinepedia/presentation/widgets/widgets.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie-screen';
  final String movieId;

  const MovieScreen({
    super.key,
    required this.movieId,
  });

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieDetailsProvider.notifier).loadMovie(widget.movieId);
    ref.read(castByMovieProvider.notifier).loadCast(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieDetailsProvider)[widget.movieId];

    if (movie == null) {
      return const Loader();
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          MovieDetailAppBar(movie: movie),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _MovieView(movie: movie),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieView extends StatelessWidget {
  final Movie movie;
  const _MovieView({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: AppTextTheme.whiteTitleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ).animate().shimmer(
                        duration: 700.ms,
                        delay: 1000.ms,
                        colors: [Colors.white, Colors.grey.shade700],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            Helper.getRelease(movie.releaseDate),
                            style: AppTextTheme.greyBodySmall,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          movie.runtime != 0
                              ? Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.grey.shade700.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    Helper.getMovieRuntime(movie.runtime!),
                                    style: AppTextTheme.greyBodySmall,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: RatingStars.movieRating(movie.voteAverage),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          movie.voteAverage == 0
                              ? ''
                              : movie.voteAverage.toStringAsFixed(1),
                          style: AppTextTheme.colorfulBodySmall?.copyWith(
                            color: RatingColor.averageColor(movie.voteAverage),
                          ),
                        ),
                        Text(
                          movie.voteCount == 0
                              ? 'Sin valoraciones'
                              : ' en ${movie.voteCount} valoraciones',
                          style: AppTextTheme.greyBodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ).animate().fadeIn(duration: 500.ms),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Wrap(
              spacing: 10,
              children: [
                ...movie.genreIds.map(
                  (gender) => Chip(
                    side: BorderSide.none,
                    elevation: 0,
                    label: Text(
                      gender,
                      style: AppTextTheme.colorfulBodySmall
                          ?.copyWith(color: AppColor.royalBlue),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ],
            ).animate().fadeIn(delay: 500.ms, duration: 500.ms),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              movie.overview,
              style: AppTextTheme.whiteBodyMedium,
            ).animate().fadeIn(delay: 700.ms, duration: 500.ms),
          ),
          _Cast(movieId: movie.id.toString()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _Cast extends ConsumerWidget {
  final String movieId;

  const _Cast({required this.movieId});

  @override
  Widget build(BuildContext context, ref) {
    final castByMovie = ref.watch(castByMovieProvider);

    if (castByMovie[movieId] == null) {
      return const Loader();
    }

    final cast = castByMovie[movieId]!;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 375,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Elenco',
            style: AppTextTheme.whiteTitleLarge,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cast.length,
              itemBuilder: (context, index) {
                final actor = cast[index];

                return Container(
                  width: 150,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          actor.profilePath!,
                          height: 200,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress != null) {
                              return const Loader();
                            }
                            return child.animate().fadeIn(duration: 400.ms);
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        actor.name,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.whiteBodyMedium,
                      ),
                      Text(
                        actor.character!,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.colorfulBodySmall
                            ?.copyWith(color: AppColor.royalBlue),
                      ),
                    ],
                  )
                      .animate()
                      .fadeIn(duration: 200.ms)
                      .moveX(begin: 20, duration: 200.ms)
                      .then()
                      .fadeIn(duration: 200.ms)
                      .moveX(begin: 20, duration: 200.ms, delay: 200.ms),
                );
              },
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 900.ms, duration: 500.ms);
  }
}
