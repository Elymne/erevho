import 'package:erevho/core/data/hive_crud.dart';
import 'package:erevho/data/models/dream/dream_model.dart';
import 'package:injectable/injectable.dart';

/// Dream nosql DB CRUD.
@Singleton()
class DreamLocalDataSource extends HiveCrud<DreamModel, String> {
  DreamLocalDataSource({required super.boxName});
}
