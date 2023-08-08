import 'package:cinepedia/config/config.dart';
import 'package:cinepedia/domain/entities/movie.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return const Text('BuildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMovies(query),
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              title: Text(
                movie.title,
                style: AppTextTheme.whiteBodyMedium,
              ),
            );
          },
        );
      },
    );
  }
}
