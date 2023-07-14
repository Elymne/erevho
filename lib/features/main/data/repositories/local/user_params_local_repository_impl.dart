import 'package:erevho/features/main/data/datasources/local/user_params_local_data_source.dart';
import 'package:erevho/features/main/domain/entities/user_params/user_params.entity.dart';
import 'package:erevho/features/main/domain/repositories/local/user_params_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userParamsLocalRepositoryProvider = Provider<UserParamsLocalRepository>((ref) {
  return UserParamsLocalRepositoryImpl(ref.read(userParamsLocalDataSourceProvider));
});

class UserParamsLocalRepositoryImpl implements UserParamsLocalRepository {
  final UserParamsLocalDataSource userParamsLocalDataSource;

  UserParamsLocalRepositoryImpl(this.userParamsLocalDataSource);

  @override
  Future<UserParams?> getUserParams() async {
    return userParamsLocalDataSource.box.getAll().firstOrNull;
  }

  @override
  Future<int> putUserParams(UserParams userParams) async {
    return userParamsLocalDataSource.box.put(userParams);
  }
}
