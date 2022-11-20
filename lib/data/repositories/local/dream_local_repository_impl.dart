import 'package:erevho/data/datasources/local/dream_local_data_source.dart';
import 'package:erevho/data/models/dream/dream_model.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/repositories/local/dream_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dreamLocalRepositoryProvider = Provider((ref) => DreamLocalRepositoryImpl(ref.read(dreamLocalDataSourceProvider)));

/// Basic Repository through dreams dabatase data.
class DreamLocalRepositoryImpl implements DreamLocalRepository {
  final DreamLocalDataSource dreamLocalDataSource;

  DreamLocalRepositoryImpl(this.dreamLocalDataSource);

  @override
  Future<int> createOne(DreamEntity dreamEntity) async {
    return await dreamLocalDataSource.createOne(dreamEntity as DreamModel);
  }

  @override
  Future<DreamEntity> getOne(String id) {
    return dreamLocalDataSource.readOne(id);
  }

  @override
  Future<List<DreamEntity>> getAll() async {
    return dreamLocalDataSource.readAll();
  }

  @override
  Future updateOne(DreamEntity dreamEntity) async {
    return dreamLocalDataSource.updateOne(dreamEntity as DreamModel);
  }

  @override
  Future deleteOne(String id) async {
    dreamLocalDataSource.deleteOne(id);
  }

  @override
  Future deleteAll(List<String> ids) async {
    dreamLocalDataSource.deleteAll(ids);
  }
}
