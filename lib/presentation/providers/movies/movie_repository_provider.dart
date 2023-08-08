import 'package:cinepedia/infrastructure/infrastructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//inmutable repository
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImp(MovieTMDBDataSource());
});
