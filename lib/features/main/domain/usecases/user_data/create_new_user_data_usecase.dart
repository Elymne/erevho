import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/main/domain/repositories/local/user_data_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../../core/params.dart';
import '../../../data/repositories/local/user_params_local_repository_impl.dart';
import '../../entities/user_data/user_data.entity.dart';

final createNewUserParamsUsecaseProvider = Provider(
  (ref) => CreateNewUserParamsUsecase(ref.read(userDataLocalRepositoryProvider)),
);

class CreateNewUserParamsUsecase extends Usecase<void, CreateNewUserParamsUsecaseParams> {
  final UserDataLocalRepository userParamsLocalRepository;

  CreateNewUserParamsUsecase(this.userParamsLocalRepository);

  @override
  Future<void> perform(CreateNewUserParamsUsecaseParams params) async {
    // Here we check that user has no users params by fetching user params.
    final userParams = await userParamsLocalRepository.getUserData();

    // If user already have settings (that's not normal if this usecase is used) we remove all user params data.
    if (userParams != null) {
      userParamsLocalRepository.removeAllUserDatas();
    }

    await userParamsLocalRepository.putUserData(UserData(
      uuid: const Uuid().v4(),
      pseudonym: params.userName,
    ));
  }
}

class CreateNewUserParamsUsecaseParams extends Params {
  final String userName;

  CreateNewUserParamsUsecaseParams({required this.userName});
}
