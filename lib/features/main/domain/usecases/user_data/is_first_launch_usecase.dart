import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/main/data/repositories/local/user_params_local_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repositories/local/user_data_local_repository.dart';

final isFirstLaunchUsecaseProvider = Provider<IsFirstLaunchUsecase>((ref) {
  return IsFirstLaunchUsecase(ref.read(userDataLocalRepositoryProvider));
});

/// Usecase to check if user has his parameters configured.
/// We need this while in splashscreeen to know if user has already configure his name.
class IsFirstLaunchUsecase extends UsecaseNoParams<bool> {
  final UserDataLocalRepository userDataLocalRepository;

  IsFirstLaunchUsecase(this.userDataLocalRepository);

  @override
  Future<bool> perform() async {
    final userData = await userDataLocalRepository.getCurrent();
    return userData == null;
  }
}
