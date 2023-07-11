import 'package:erevho/features/main/data/datasources/local/dream_local_data_source.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:erevho/features/main/domain/repositories/local/dream_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../objectbox.g.dart';

final dreamLocalRepositoryProvider = Provider<DreamLocalRepository>((ref) => DreamLocalRepositoryImpl(ref.read(dreamLocalDataSourceProvider)));

class DreamLocalRepositoryImpl implements DreamLocalRepository {
  final DreamLocalDataSource dreamLocalDataSource;

  DreamLocalRepositoryImpl(this.dreamLocalDataSource);

  @override
  Future<Dream?> getOne(String id) async {
    return dreamLocalDataSource.box.query(Dream_.uuid.equals(id)).build().findUnique();
  }

  @override
  Future<List<Dream>> getAll() async {
    return dreamLocalDataSource.box.getAll();
  }

  @override
  Future<int> putOne(Dream dream) async {
    return dreamLocalDataSource.box.put(dream);
  }

  @override
  Future<int> deleteOne(String id) async {
    return dreamLocalDataSource.box.query(Dream_.uuid.equals(id)).build().remove();
  }

  @override
  Future<int> deleteAll(List<String> ids) async {
    var removedNb = 0;
    for (var id in ids) {
      removedNb += dreamLocalDataSource.box.query(Dream_.uuid.contains(id)).build().remove();
    }
    return removedNb;
  }
}
