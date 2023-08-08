import 'package:cinepedia/domain/entities/movie_cast.dart';
import 'package:cinepedia/infrastructure/models/themoviedb/movie_credits_themoviedb_response.dart';

class MovieCastMapper {
  static Actor movieCastToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath == null
            ? 'https://static.vecteezy.com/system/resources/previews/001/840/618/original/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg'
            : 'https://image.tmdb.org/t/p/w500/${cast.profilePath}',
        character: cast.character ?? '',
      );
}
