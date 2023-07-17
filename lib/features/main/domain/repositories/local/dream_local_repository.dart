import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';

/// Absract definitions of fetch call.
abstract class DreamLocalRepository {
  Future<List<Dream>> getAll();
  Future<List<Dream>> getAllFiltered({
    String? uuid,
    String? pseudonym,
    String? userUuid,
    String? title,
    String? content,
    List<String> tags = const [],
  });
  Future<Dream?> getOne(String id);

  Future<int> putOne(Dream dream);

  Future<int> deleteOne(String id);
  Future<int> deleteAll(List<String> ids);
}
