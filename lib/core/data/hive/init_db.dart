import 'package:erevho/features/main/data/models/dream/dream_model.dart';
import 'package:erevho/features/main/data/models/dream/tag_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Init NoSql DB from Hive.
initDb() async {
  Hive.initFlutter();
  Hive.registerAdapter(TagModelAdapter());
  Hive.registerAdapter(DreamModelAdapter());
}
