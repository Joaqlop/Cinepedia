import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:cinepedia/presentation/widgets/widgets.dart';
import 'package:cinepedia/domain/domain.dart';

class MasonryView extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MasonryView({super.key, required this.movies, this.loadNextPage});

  @override
  State<MasonryView> createState() => _MasonryViewState();
}

class _MasonryViewState extends State<MasonryView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if ((scrollController.position.pixels + 100) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: MasonryGridView.count(
        controller: scrollController,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          if (index == 1) {
            return Column(
              children: [
                const SizedBox(height: 40),
                FavoritePoster(movie: widget.movies[index])
                    .animate()
                    .fadeIn(duration: 500.ms),
              ],
            );
          }
          return FavoritePoster(movie: widget.movies[index])
              .animate()
              .fadeIn(duration: 500.ms)
              .then()
              .moveY(begin: -10, duration: 100.ms);
        },
      ),
    );
  }
}
