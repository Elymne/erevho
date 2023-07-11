import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';

/// Absract definitions of fetch call.
abstract class DreamLocalRepository {
  Future<List<Dream>> getAll();
  Future<Dream?> getOne(String id);

  Future<int> putOne(Dream dream);

  Future<int> deleteOne(String id);
  Future<int> deleteAll(List<String> ids);
}
