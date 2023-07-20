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
  Future<UserData?> getCurrent() async {
    return userParamsLocalDataSource.box.getAll().firstOrNull?.toEntity();
  }

  @override
  Future<int> clear() async {
    return userParamsLocalDataSource.box.removeAll();
  }

  @override
  Future<int> create(UserData userData) async {
    return userParamsLocalDataSource.box.put(UserDataModel.fromEntity(userData: userData));
  }

  @override
  Future<int> update(UserData userData) async {
    final userDataModel = userParamsLocalDataSource.box.getAll().firstOrNull;
    if (userDataModel == null) throw ('No userData with uuid : ${userData.uuid}');
    return userParamsLocalDataSource.box.put(UserDataModel.fromEntity(userData: userData, id: userDataModel.id));
  }
}
