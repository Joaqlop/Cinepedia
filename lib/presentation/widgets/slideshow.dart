import 'package:cinepedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:cinepedia/domain/entities/movie.dart';

import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';

class SlideShow extends StatelessWidget {
  final List<Movie> movies;

  const SlideShow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 320,
        width: double.infinity,
        child: Swiper(
          physics: const BouncingScrollPhysics(),
          autoplayDelay: 5000,
          duration: 2000,
          curve: Curves.easeInOutCubicEmphasized,
          autoplay: true,
          autoplayDisableOnInteraction: true,
          itemCount: movies.length,
          viewportFraction: 0.5,
          scale: 0.6,
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
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 15,
          offset: Offset(0, 10),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.posterPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const Loader();
              }
              return FadeIn(
                duration: const Duration(milliseconds: 200),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
