import 'package:cinepedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinepedia/domain/entities/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [MovieSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isToggled(int movieId) async {
    final isar = await db;
    final Movie? movieIsToggled =
        await isar.movies.filter().idEqualTo(movieId).findFirst();

    return movieIsToggled != null;
  }

  @override
  Future<void> toggle(Movie movie) async {
    final isar = await db;
    final toggledMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();

    if (toggledMovie != null) {
      //borrar
      isar.writeTxnSync(() => isar.movies.deleteSync(toggledMovie.isarId!));
      return;
    }

    //insert
    isar.writeTxnSync(() => isar.movies.putSync(movie));
    return;
  }

  @override
  Future<List<Movie>> loadFavorites({int limit = 10, offset = 0}) async {
    final isar = await db;
    return isar.movies.where().offset(offset).limit(limit).findAll();
  }
}
