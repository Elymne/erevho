import 'package:erevho/features/main/data/datasources/local/chapter_local_data_source.dart';
import 'package:erevho/features/main/data/datasources/local/dream_local_data_source.dart';
import 'package:erevho/features/main/data/models/dreams/chapter.model.dart';
import 'package:erevho/features/main/data/models/dreams/dream.model.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:erevho/features/main/domain/repositories/local/dream_local_repository.dart';
import 'package:erevho/main.dart';
import 'package:erevho/objectbox.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dreamLocalRepositoryProvider = Provider<DreamLocalRepository>((ref) {
  return DreamLocalRepositoryImpl(
    ref.read(dreamLocalDataSourceProvider),
    ref.read(chapterLocalDataSourceProvider),
  );
});

class DreamLocalRepositoryImpl implements DreamLocalRepository {
  final DreamLocalDataSource dreamLocalDataSource;
  final ChapterLocalDataSource chapterLocalDataSource;

  DreamLocalRepositoryImpl(this.dreamLocalDataSource, this.chapterLocalDataSource);

  @override
  Future<Dream?> getOne(String uuid) async {
    return objectbox.store.runInTransaction(TxMode.read, () {
      final chapters = chapterLocalDataSource.box.query(ChapterModel_.dreamUuid.equals(uuid)).build().find().map((chapterModel) {
        return chapterModel.toEntity();
      }).toList();
      return dreamLocalDataSource.box.query(DreamModel_.uuid.equals(uuid)).build().findUnique()?.toEntity(chapters: chapters);
    });
  }

  @override
  Future<List<Dream>> getAll() async {
    return objectbox.store.runInTransaction(TxMode.read, () {
      return dreamLocalDataSource.box.getAll().map((dreamModel) {
        final chapters = chapterLocalDataSource.box.query(ChapterModel_.dreamUuid.equals(dreamModel.uuid)).build().find().map((chapterModel) {
          return chapterModel.toEntity();
        }).toList();
        return dreamModel.toEntity(chapters: chapters);
      }).toList();
    });
  }

  @override
  Future<void> createOne(Dream dream) async {
    final dreamModel = dreamLocalDataSource.box.query(DreamModel_.uuid.equals(dream.uuid)).build().findUnique();
    if (dreamModel != null) throw ('A dream already exists with this uuid : ${dream.uuid}. Do not use an existing dream with createOne function.');

    for (final chapter in dream.chapters) {
      final chapterModel = chapterLocalDataSource.box.query(ChapterModel_.uuid.equals(chapter.uuid)).build().findUnique();
      if (chapterModel != null) throw ('A Chapter already exists with this uuid : ${dream.uuid}. Do not use an existing chapter with createOne function');
    }

    objectbox.store.runInTransaction(TxMode.write, () {
      dreamLocalDataSource.box.put(DreamModel.fromEntity(dream: dream));
      chapterLocalDataSource.box.putMany(dream.chapters.map((chapter) {
        return ChapterModel.fromEntity(chapter: chapter, dreamUuid: dream.uuid);
      }).toList());
    });
  }

  // todo suppression de la diff de chapitres.
  @override
  Future<void> updateOne(Dream dream) async {
    final dreamModel = dreamLocalDataSource.box.query(DreamModel_.uuid.equals(dream.uuid)).build().findUnique();
    if (dreamModel == null) throw ('No Dream with uuid : ${dream.uuid}');

    objectbox.store.runInTransaction(TxMode.write, () {
      dreamLocalDataSource.box.put(DreamModel.fromEntity(id: dreamModel.id, dream: dream));
      chapterLocalDataSource.box.putMany(dream.chapters.map((chapter) {
        final chapterModel = chapterLocalDataSource.box.query(ChapterModel_.uuid.equals(chapter.uuid)).build().findUnique();
        return ChapterModel.fromEntity(chapter: chapter, id: chapterModel?.id, dreamUuid: dream.uuid);
      }).toList());
      // Suppression des chapitres en trop.
    });
  }

  @override
  Future<void> deleteOne(String uuid) async {
    objectbox.store.runInTransaction(TxMode.write, () {
      chapterLocalDataSource.box.query(ChapterModel_.dreamUuid.equals(uuid)).build().remove();
      dreamLocalDataSource.box.query(DreamModel_.uuid.equals(uuid)).build().remove();
    });
  }

  @override
  Future<void> deleteAll(List<String> uuids) async {
    objectbox.store.runInTransaction(TxMode.write, () {
      for (final uuid in uuids) {
        chapterLocalDataSource.box.query(ChapterModel_.dreamUuid.equals(uuid)).build().remove();
        dreamLocalDataSource.box.query(DreamModel_.uuid.equals(uuid)).build().remove();
      }
    });
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

    return objectbox.store.runInTransaction(TxMode.read, () {
      return dreamLocalDataSource.box.query(query).build().find().map((dreamModel) {
        final chapters = chapterLocalDataSource.box.query(ChapterModel_.dreamUuid.equals(dreamModel.uuid)).build().find().map((chapterModel) {
          return chapterModel.toEntity();
        }).toList();
        return dreamModel.toEntity(chapters: chapters);
      }).toList();
    });
  }
}
