import 'package:erevho/features/main/data/models/dreams/chapter.model.dart';

abstract class ChapterLocalRepository {
  Future<ChapterModel> getOne(String uuid);
  Future<List<ChapterModel>> getAll();
  Future<int> createOne();
  Future<int> updateOne();
}
