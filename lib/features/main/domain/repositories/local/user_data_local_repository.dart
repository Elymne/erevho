import '../../entities/user_data/user_data.entity.dart';

abstract class UserDataLocalRepository {
  Future<UserData?> getUserData();
  Future<int> putUserData(UserData userParams);
  Future<int> removeAllUserDatas();
}
