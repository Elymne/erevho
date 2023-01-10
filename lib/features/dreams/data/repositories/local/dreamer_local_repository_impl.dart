import 'package:erevho/features/dreams/data/datasources/local/dreamer_local_data_source.dart';
import 'package:erevho/features/dreams/domain/entities/dreamer/dreamer.entity.dart';
import 'package:erevho/features/dreams/domain/repositories/local/dreamer_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dreamerLocalRepositoryProvider = Provider<DreamerLocalRepository>((ref) => DreamerLocalRepositoryImpl(ref.read(dreamerLocalDataSourceProvider)));

class DreamerLocalRepositoryImpl implements DreamerLocalRepository {
  final DreamerLocalDataSource dreamerLocalDataSource;

  DreamerLocalRepositoryImpl(this.dreamerLocalDataSource);

  @override
  Future<int> createOne(Dreamer dreamer) => dreamerLocalDataSource.createOne(dreamer);

  @override
  Future<List<Dreamer>> getAll() => dreamerLocalDataSource.readAll();

  @override
  Future updateOne(Dreamer dreamer) => dreamerLocalDataSource.updateOne(dreamer);
}
