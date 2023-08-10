import 'package:erevho/features/main/data/datasources/local/chapter_local_data_source.dart';
import 'package:erevho/features/main/data/models/dreams/chapter.model.dart';
import 'package:erevho/features/main/domain/repositories/local/chapter_local_repository.dart';

/// May not be needed.
class ChapterLocalRepositoryImpl extends ChapterLocalRepository {
  final ChapterLocalDataSource chapterLocalDataSource;

  ChapterLocalRepositoryImpl(this.chapterLocalDataSource);

  @override
  Future<ChapterModel> getOne(String uuid) {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  @override
  Future<int> createOne() {
    // TODO: implement createOne
    throw UnimplementedError();
  }

  @override
  Future<List<ChapterModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<int> updateOne() {
    // TODO: implement updateOne
    throw UnimplementedError();
  }
}
