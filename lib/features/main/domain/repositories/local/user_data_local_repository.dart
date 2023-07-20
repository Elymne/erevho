import '../../entities/user_data/user_data.entity.dart';

abstract class UserDataLocalRepository {
  Future<UserData?> getCurrent();
  Future<int> create(UserData userData);
  Future<int> update(UserData userData);
  Future<int> clear();
}
