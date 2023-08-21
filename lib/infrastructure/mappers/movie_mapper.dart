import 'package:cinepedia/domain/entities/movie.dart';
import 'package:cinepedia/infrastructure/models/themoviedb/movie_details_themoviedb.dart';
import 'package:cinepedia/infrastructure/models/themoviedb/movie_themoviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieFromMovieDB moviedb) => Movie(
        adult: moviedb.adult,
        backdropPath: moviedb.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}'
            : 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Solid_black.svg/1024px-Solid_black.svg.png',
        genreIds: moviedb.genreIds.map((x) => x.toString()).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview != ''
            ? moviedb.overview
            : 'Este título no tiene ninguna descripción',
        popularity: moviedb.popularity,
        posterPath: moviedb.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${moviedb.posterPath}'
            : 'https://i0.wp.com/roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg?resize=400%2C400&ssl=1',
        releaseDate: moviedb.releaseDate ?? DateTime.now(),
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount,
      );

  static Movie movieDetailsToEntity(MovieDetails moviedb) => Movie(
        adult: moviedb.adult,
        backdropPath: moviedb.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}'
            : 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Solid_black.svg/1024px-Solid_black.svg.png',
        genreIds: moviedb.genres.map((x) => x.name).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview != ''
            ? moviedb.overview
            : 'Este título no tiene ninguna descripción',
        popularity: moviedb.popularity,
        posterPath: moviedb.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${moviedb.posterPath}'
            : '',
        releaseDate: moviedb.releaseDate,
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount,
        runtime: moviedb.runtime,
      );
}
