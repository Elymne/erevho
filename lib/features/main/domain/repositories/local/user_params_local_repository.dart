import 'package:erevho/features/main/domain/entities/user_params/user_params.entity.dart';

abstract class UserParamsLocalRepository {
  Future<UserParams?> getUserParams();
  Future<int> putUserParams(UserParams userParams);
}
