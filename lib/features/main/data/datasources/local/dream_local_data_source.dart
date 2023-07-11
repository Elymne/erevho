import 'package:erevho/core/data/object_store.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../objectbox.g.dart';

final dreamLocalDataSourceProvider = Provider<DreamLocalDataSource>((_) => DreamLocalDataSource());

class DreamLocalDataSource extends ObjectStore<Dream> {
  /// ObjectBox use integer id by default. We want to use uuid so we have to use a special query to select one.
  Future<Dream?> getUniqueByUUID(String uuid) async {
    return box.query(Dream_.uuid.equals(uuid)).build().findUnique();
  }
}
