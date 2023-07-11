import 'package:erevho/core/data/object_store.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dreamLocalDataSourceProvider = Provider<DreamLocalDataSource>((_) => DreamLocalDataSource());

class DreamLocalDataSource extends ObjectStore<Dream> {}
