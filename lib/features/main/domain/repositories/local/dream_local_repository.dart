import 'package:erevho/features/main/domain/entities/dream/dream.entity.dart';

/// Absract definitions of fetch call.
abstract class DreamLocalRepository {
  Future<Dream> getOne(String id);
  Future<List<Dream>> getAll();
  Future<int> createOne(Dream dreamEntity);
  Future updateOne(Dream dreamEntity);
  Future deleteOne(String id);
  Future deleteAll(List<String> ids);
}
