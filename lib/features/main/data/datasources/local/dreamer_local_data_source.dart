import 'package:erevho/core/data/hive/hive_crud.dart';
import 'package:erevho/features/main/domain/entities/dreamer/dreamer.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dreamerLocalDataSourceProvider = Provider<DreamerLocalDataSource>((_) => DreamerLocalDataSource());

class DreamerLocalDataSource extends HiveCrud<Dreamer, String> {
  DreamerLocalDataSource() : super(boxName: 'BOX_DREAMER');
}
