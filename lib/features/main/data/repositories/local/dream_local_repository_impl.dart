import 'package:erevho/features/main/data/datasources/local/dream_local_data_source.dart';
import 'package:erevho/features/main/data/models/dreams/dream.model.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:erevho/features/main/domain/repositories/local/dream_local_repository.dart';
import 'package:erevho/objectbox.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dreamLocalRepositoryProvider = Provider<DreamLocalRepository>((ref) {
  return DreamLocalRepositoryImpl(ref.read(dreamLocalDataSourceProvider));
});

class DreamLocalRepositoryImpl implements DreamLocalRepository {
  final DreamLocalDataSource dreamLocalDataSource;

  DreamLocalRepositoryImpl(this.dreamLocalDataSource);

  @override
  Future<Dream?> getOne(String id) async {
    return dreamLocalDataSource.box.query(DreamModel_.uuid.equals(id)).build().findUnique()?.toEntity();
  }

  @override
  Future<List<Dream>> getAll() async {
    return dreamLocalDataSource.box.getAll().map((e) => e.toEntity()).toList();
  }

  @override
  Future<int> putOne(Dream dream) async {
    return dreamLocalDataSource.box.put(DreamModel.fromEntity(dream));
  }

  @override
  Future<int> deleteOne(String id) async {
    return dreamLocalDataSource.box.query(DreamModel_.uuid.equals(id)).build().remove();
  }

  @override
  Future<int> deleteAll(List<String> ids) async {
    var removedNb = 0;
    for (var id in ids) {
      removedNb += dreamLocalDataSource.box.query(DreamModel_.uuid.contains(id)).build().remove();
    }
    return removedNb;
  }

  @override
  Future<List<Dream>> getAllFiltered({String? uuid, String? pseudonym, String? userUuid, String? title, String? content, List<String> tags = const []}) async {
    // I want to get all dreams if no filter is selected, and no uuid can't be equals to an empty String, thus allow me to get all dreams.
    final Condition<DreamModel> query = DreamModel_.uuid.notEquals('');

    // Filters conditions.
    if (uuid != null) query.and(DreamModel_.uuid.equals(uuid));
    if (pseudonym != null) query.and(DreamModel_.uuid.equals(pseudonym));
    if (userUuid != null) query.and(DreamModel_.uuid.equals(userUuid));
    if (title != null) query.and(DreamModel_.uuid.equals(title));
    if (content != null) query.and(DreamModel_.uuid.equals(content));
    if (tags.isNotEmpty) {
      for (var tag in tags) {
        query.and(DreamModel_.tags.containsElement(tag));
      }
    }

    return dreamLocalDataSource.box.query(query).build().find().map((e) => e.toEntity()).toList();
  }
}
