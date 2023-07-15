import 'package:erevho/features/main/data/datasources/local/user_data_local_data_source.dart';
import 'package:erevho/features/main/data/models/user_data/user_data.model.dart';
import 'package:erevho/features/main/domain/repositories/local/user_data_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/user_data/user_data.entity.dart';

final userDataLocalRepositoryProvider = Provider<UserDataLocalRepository>((ref) {
  return UserDataLocalRepositoryImpl(ref.read(userDataLocalDataSourceProvider));
});

class UserDataLocalRepositoryImpl implements UserDataLocalRepository {
  final UserDataLocalDataSource userParamsLocalDataSource;

  UserDataLocalRepositoryImpl(this.userParamsLocalDataSource);

  @override
  Future<UserData?> getUserData() async {
    return userParamsLocalDataSource.box.getAll().firstOrNull?.toEntity();
  }

  @override
  Future<int> putUserData(UserData userData) async {
    return userParamsLocalDataSource.box.put(UserDataModel.fromEntity(userData));
  }

  @override
  Future<int> removeAllUserDatas() async {
    return userParamsLocalDataSource.box.removeAll();
  }
}
