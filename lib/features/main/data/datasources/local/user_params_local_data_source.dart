import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/data/object_store.dart';
import '../../../domain/entities/user_params/user_params.entity.dart';

final userParamsLocalDataSourceProvider = Provider<UserParamsLocalDataSource>((_) => UserParamsLocalDataSource());

class UserParamsLocalDataSource extends ObjectStore<UserParams> {}
