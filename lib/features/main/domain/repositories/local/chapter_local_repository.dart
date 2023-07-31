import 'package:erevho/features/main/data/models/dreams/chapter.model.dart';

abstract class ChapterLocalRepository {
  ChapterModel getOne(String uuid);
}
