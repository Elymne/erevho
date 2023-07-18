import 'package:erevho/core/controller.dart';
import 'package:erevho/features/main/application/pages/dream_form/dream_form_page.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:erevho/features/main/domain/usecases/dreams/get_all_user_dreams_filtered_usecase.dart';
import 'package:flutter/material.dart';
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

  void goToDreamFormPage(BuildContext context, String uuid) {
    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DreamFormPage(dreamUuid: uuid),
        ),
      );
    }
  }

  UserDreamsListController(super.ref);
}
