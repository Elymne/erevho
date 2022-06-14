import 'package:erevho/domain/entities/dream/dream_entity.dart';

/// Absract definitions of fetch call.
abstract class DreamLocalRepository {
  Future<DreamEntity> getOne();
  Future<DreamEntity> getAll();
  Future<int> createOne();
  Future<int> updateOne();
  Future deleteOne();
  Future deleteAll();
}
