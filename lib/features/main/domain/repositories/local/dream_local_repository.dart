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

  Future<void> createOne(Dream dream);
  Future<void> updateOne(Dream dream);
  Future<void> deleteOne(String id);
  Future<void> deleteAll(List<String> ids);
}
