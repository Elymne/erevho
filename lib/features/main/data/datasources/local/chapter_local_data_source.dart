import 'package:erevho/core/data/object_store.dart';
import 'package:erevho/features/main/data/models/dreams/chapter.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chapterLocalDataSourceProvider = Provider((ref) => ChapterLocalDataSource());

class ChapterLocalDataSource extends ObjectStore<ChapterModel> {}
