import 'package:cinepedia/config/config.dart';

import 'package:cinepedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MovieDetailAppBar extends StatelessWidget {
  final Movie movie;
  const MovieDetailAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: AppColor.vulcan,
      foregroundColor: Colors.white,
      expandedHeight: size.height * 0.65,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
              ).animate().fadeIn(
                    duration: 700.ms,
                  ),
            ),
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.1, 0.7, 1],
                    colors: [
                      Colors.black38,
                      Colors.transparent,
                      AppColor.vulcan,
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
