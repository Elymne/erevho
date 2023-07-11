import 'package:flutter_riverpod/flutter_riverpod.dart';

final dreamLocalDataSourceProvider = Provider<DreamLocalDataSource>((_) => DreamLocalDataSource());

/// Dream nosql DB CRUD.
class DreamLocalDataSource extends HiveCrud<DreamModel, String> {
  DreamLocalDataSource() : super(boxName: 'BOX_DREAM');
}
