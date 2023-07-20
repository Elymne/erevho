import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/main/data/repositories/local/user_params_local_repository_impl.dart';
import 'package:erevho/features/main/domain/entities/user_data/user_data.entity.dart';
import 'package:erevho/features/main/domain/repositories/local/user_data_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getUserDataUsercaseProvider = Provider((ref) => GetUserDataUsecase(ref.read(userDataLocalRepositoryProvider)));

/// This use case allow me to get the user data and use it to display information in settings view and to say hello in home view.
class GetUserDataUsecase extends UsecaseNoParams<UserData?> {
  final UserDataLocalRepository userDataLocalRepository;

  GetUserDataUsecase(this.userDataLocalRepository);

  @override
  Future<UserData?> perform() async {
    return userDataLocalRepository.getCurrent();
  }
}
