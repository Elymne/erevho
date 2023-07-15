import 'package:erevho/features/main/data/models/user_data/user_data.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/data/object_store.dart';

final userDataLocalDataSourceProvider = Provider<UserDataLocalDataSource>((_) => UserDataLocalDataSource());

class UserDataLocalDataSource extends ObjectStore<UserDataModel> {}
