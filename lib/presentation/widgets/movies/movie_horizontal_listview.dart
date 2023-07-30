import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:cinepedia/config/helpers/human_formats.dart';
import 'package:cinepedia/domain/entities/movie.dart';
import 'package:cinepedia/presentation/widgets/widgets.dart';

class MovieHorizontalListView extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListView({
    super.key,
    required this.movies,
    this.title,
    this.subtitle,
    this.loadNextPage,
  });

  @override
  State<MovieHorizontalListView> createState() =>
      _MovieHorizontalListViewState();
}

class _MovieHorizontalListViewState extends State<MovieHorizontalListView> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if ((scrollController.position.pixels + 200) >=
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
    return SizedBox(
      height: 370,
      child: Column(
        children: [
          _Title(
            title: widget.title,
            subtitle: widget.subtitle,
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  FadeInRight(child: _Slide(movie: widget.movies[index])),
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    );

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10, right: 5),
      child: Row(
        children: [
          Text(
            title ?? '',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const Spacer(),
          subtitle != null
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: decoration,
                  child: Text(
                    subtitle!,
                    style: const TextStyle(color: Colors.black),
                  ))
              : Container(),
          const SizedBox(width: 5),
          MaterialButton(
            minWidth: 60,
            color: Colors.grey.shade900.withOpacity(0.5),
            highlightColor: Colors.black,
            splashColor: Colors.white30,
            visualDensity: VisualDensity.comfortable,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onPressed: () {},
            child: const Text(
              '>',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    final textStyles = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image
          SizedBox(
            width: 150,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Loader();
                  }
                  return FadeIn(child: child);
                },
              ),
            ),
          ),
          //Title
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            width: 150,
            child: Text(
              movie.title,
              style: textStyles.titleSmall?.copyWith(color: color),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Rating
          Row(
            children: [
              Icon(
                Icons.star,
                size: 18,
                color: AverageColor.averageColor(movie.voteAverage),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                movie.voteAverage.toStringAsFixed(1),
                style: textStyles.bodyMedium?.copyWith(
                  color: AverageColor.averageColor(movie.voteAverage),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(7),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  HumanFormats.popularity(movie.popularity),
                  style: textStyles.bodySmall
                      ?.copyWith(color: Colors.grey.shade400),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
