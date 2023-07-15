import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/main/data/repositories/local/user_params_local_repository_impl.dart';
import 'package:erevho/features/main/domain/entities/user_params/user_params.entity.dart';
import 'package:erevho/features/main/domain/repositories/local/user_params_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../../core/params.dart';

final createNewUserParamsUsecaseProvider = Provider(
  (ref) => CreateNewUserParamsUsecase(ref.read(userParamsLocalRepositoryProvider)),
);

class CreateNewUserParamsUsecase extends Usecase<void, CreateNewUserParamsUsecaseParams> {
  final UserParamsLocalRepository userParamsLocalRepository;

  CreateNewUserParamsUsecase(this.userParamsLocalRepository);

  @override
  Future<void> perform(CreateNewUserParamsUsecaseParams params) async {
    // Here we check that user has no users params by fetching user params.
    final userParams = await userParamsLocalRepository.getUserParams();

    // If user already have settings (that's not normal if this usecase is used) we remove all user params data.
    if (userParams != null) {
      userParamsLocalRepository.removeAllUserParams();
    }

    final createdUserParams = await userParamsLocalRepository.putUserParams(UserParams(
      uuid: const Uuid().v4(),
      pseudonym: params.userName,
    ));

    // One value should be created, no less, no more.
    if (createdUserParams != 1) {
      throw ('User was not created');
    }
  }
}

class CreateNewUserParamsUsecaseParams extends Params {
  final String userName;

  CreateNewUserParamsUsecaseParams({required this.userName});
}
