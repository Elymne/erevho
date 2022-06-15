import 'package:erevho/core/data/hive_crud.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:injectable/injectable.dart';

/// Dream nosql DB CRUD.
@singleton
class DreamLocalDataSource extends HiveCrud<DreamEntity, String> {
  DreamLocalDataSource() : super(boxName: 'BOX_DREAM');
}
