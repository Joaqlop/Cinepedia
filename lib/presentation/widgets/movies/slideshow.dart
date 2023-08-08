import 'package:cinepedia/config/config.dart';
import 'package:cinepedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:cinepedia/domain/entities/movie.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SlideShow extends StatelessWidget {
  final List<Movie> movies;

  const SlideShow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Swiper(
          physics: const BouncingScrollPhysics(),
          duration: 2000,
          curve: Curves.ease,
          autoplay: true,
          autoplayDisableOnInteraction: true,
          itemCount: movies.length,
          viewportFraction: 0.7,
          scale: 0.7,
          itemBuilder: (context, index) => _Slide(movie: movies[index]),
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: AppColor.royalBlue,
          blurRadius: 15,
          offset: const Offset(3, 3),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 15),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const Loader();
              }
              return GestureDetector(
                onTap: () => context.push('/movie/${movie.id}'),
                child: child.animate().fadeIn(duration: 500.ms),
              );
            },
          ).animate().fadeIn(duration: 500.ms),
        ),
      ),
    );
  }
}
