import 'package:erevho/core/data/object_store.dart';
import 'package:erevho/features/main/data/models/dreams/dream.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dreamLocalDataSourceProvider = Provider<DreamLocalDataSource>((_) => DreamLocalDataSource());

class DreamLocalDataSource extends ObjectStore<DreamModel> {}
