import 'package:erevho/domain/entities/dream/dream_entity.dart';

/// Absract definitions of fetch call.
abstract class DreamLocalRepository {
  Future<DreamEntity> getOne(String id);
  Future<DreamEntity> getAll();
  Future<int> createOne(DreamEntity dreamEntity);
  Future<int> updateOne(DreamEntity dreamEntity);
  Future deleteOne(String id);
  Future deleteAll(List<String> ids);
}
