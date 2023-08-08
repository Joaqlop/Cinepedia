import 'package:cinepedia/config/config.dart';
import 'package:cinepedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinepedia/presentation/providers/providers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Cinepedia',
            style: GoogleFonts.comfortaa(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ).animate().shimmer(
            delay: 200.ms,
            duration: 700.ms,
            colors: [AppColor.royalBlue, Colors.white],
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              final movieRepository = ref.read(movieRepositoryProvider);

              showSearch(
                context: context,
                delegate: SearchMovieDelegate(
                  searchMovies: movieRepository.searchMovies,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
