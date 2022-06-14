import 'package:erevho/core/data/hive_crud.dart';
import 'package:erevho/data/models/dream_model.dart';

/// Dream nosql DB CRUD.
class DreamLocalDataSource extends HiveCrud<DreamModel, String> {
  DreamLocalDataSource({required super.boxName});
}
