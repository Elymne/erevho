import 'package:erevho/data/datasources/local/dream_local_data_source.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/repositories/local/dream_local_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: DreamLocalRepository)
class DreamLocalRepositoryImpl implements DreamLocalRepository {
  final DreamLocalDataSource dreamLocalDataSource;

  DreamLocalRepositoryImpl(this.dreamLocalDataSource);

  @override
  Future<int> createOne(DreamEntity dreamEntity) async {
    return await dreamLocalDataSource.createOne(dreamEntity);
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
    return dreamLocalDataSource.updateOne(dreamEntity);
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
