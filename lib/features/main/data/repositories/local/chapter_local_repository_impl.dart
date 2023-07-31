import 'package:erevho/features/main/data/datasources/local/chapter_local_data_source.dart';
import 'package:erevho/features/main/data/models/dreams/chapter.model.dart';
import 'package:erevho/features/main/domain/repositories/local/chapter_local_repository.dart';

/// May not be needed.
class ChapterLocalRepositoryImpl extends ChapterLocalRepository {
  final ChapterLocalDataSource chapterLocalDataSource;

  ChapterLocalRepositoryImpl(this.chapterLocalDataSource);

  @override
  ChapterModel getOne(String uuid) {
    // TODO: implement getOne
    throw UnimplementedError();
  }
}
