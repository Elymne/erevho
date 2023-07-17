import 'package:erevho/core/controller.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:erevho/features/main/domain/usecases/dreams/get_all_user_dreams_filtered.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDreamsListControllerProvider = Provider((ref) => UserDreamsListController(ref));

class UserDreamsListController extends Controller {
  late final GetAllUserDreamsFilteredUsecase getAllUserDreamsFilteredUsecase = ref.read(getAllUserDreamsFilteredUsecaseProvider);

  final userDreamsFilteredProvider = StateProvider<List<Dream>?>((ref) => null);
  final filterParamsProvider = StateProvider<GetAllUserDreamsFilteredUsecaseParams>((ref) => GetAllUserDreamsFilteredUsecaseParams());

  Future init() async {
    ref.read(userDreamsFilteredProvider.notifier).state = await getAllUserDreamsFilteredUsecase.perform(
      GetAllUserDreamsFilteredUsecaseParams(),
    );
  }

  UserDreamsListController(super.ref);
}
