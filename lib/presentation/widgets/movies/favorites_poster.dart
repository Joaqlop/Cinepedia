import 'package:cinepedia/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class FavoritePoster extends StatelessWidget {
  final Movie movie;

  const FavoritePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/home/0/movie/${movie.id}'),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          movie.posterPath,
          fit: BoxFit.cover,
        ).animate().fadeIn(duration: 500.ms),
      ),
    );
  }
}
