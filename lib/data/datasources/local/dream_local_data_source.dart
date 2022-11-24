import 'package:erevho/core/data/hive/hive_crud.dart';
import 'package:erevho/data/models/dream/dream_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dreamLocalDataSourceProvider = Provider<DreamLocalDataSource>((_) => DreamLocalDataSource());

/// Dream nosql DB CRUD.
class DreamLocalDataSource extends HiveCrud<DreamModel, String> {
  DreamLocalDataSource() : super(boxName: 'BOX_DREAM');
}
