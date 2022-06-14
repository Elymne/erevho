import 'package:erevho/data/datasources/local/dream_local_data_source.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/repositories/local/dream_local_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: DreamLocalRepository)
class DreamLocalRepositoryImpl implements DreamLocalRepository {
  final DreamLocalDataSource dreamLocalDataSource;

  DreamLocalRepositoryImpl(this.dreamLocalDataSource);

  @override
  Future<int> createOne() {
    // TODO: implement createOne
    throw UnimplementedError();
  }

  @override
  Future deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future deleteOne() {
    // TODO: implement deleteOne
    throw UnimplementedError();
  }

  @override
  Future<DreamEntity> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<DreamEntity> getOne() {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  @override
  Future<int> updateOne() {
    // TODO: implement updateOne
    throw UnimplementedError();
  }
}
