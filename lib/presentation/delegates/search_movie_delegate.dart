import 'dart:async';

import 'package:cinepedia/presentation/widgets/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';

import 'package:cinepedia/config/config.dart';
import 'package:cinepedia/domain/entities/movie.dart';

import 'package:flutter_animate/flutter_animate.dart';

typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallBack searchMovies;

  SearchMovieDelegate({
    required this.searchMovies,
  });

  @override
  String get searchFieldLabel => 'Buscar';

  @override
  TextStyle? get searchFieldStyle => AppTextTheme.whiteSearchBodyMedium;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColor.vulcan,
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        surfaceTintColor: AppColor.vulcan,
        color: AppColor.vulcan,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: AppColor.vulcan,
          systemNavigationBarDividerColor: AppColor.vulcan,
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          splashRadius: 20,
          splashColor: AppColor.greyVulcan,
          onPressed: () => query = '',
          icon: const Icon(
            Icons.close,
            size: 20,
          ),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      splashColor: AppColor.greyVulcan,
      onPressed: () => close(context, null),
      icon: const Icon(
        Icons.arrow_back_ios_new_outlined,
        size: 15,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: searchMovies(query),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Loader();
        }
        final movies = snapshot.data!;
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return _MovieResults(movie: movies[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

class _MovieResults extends StatelessWidget {
  final Movie movie;

  const _MovieResults({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        context.push('/home/0/movie/${movie.id}');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            SizedBox(
              height: size.height * 0.12,
              width: size.width * 0.17,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  fit: BoxFit.cover,
                ),
              ),
            ).animate().fadeIn(duration: 500.ms, delay: 200.ms),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme.whiteBodyMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    movie.originalTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme.greyBodySmall,
                  ),
                ],
              ),
            )
          ],
        ),
      )
          .animate()
          .fadeIn(duration: 200.ms)
          .then()
          .moveY(begin: 20, duration: 200.ms, delay: 200.ms),
    );
  }
}
