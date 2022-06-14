import 'package:erevho/data/models/dream_model.dart';
import 'package:erevho/data/models/tag_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Init NoSql DB from Hive.
initDb() async {
  Hive.initFlutter();
  Hive.registerAdapter((TagModelAdapter()));
  Hive.registerAdapter(DreamModelAdapter());
}
