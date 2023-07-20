import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/main/data/repositories/local/dream_local_repository_impl.dart';
import 'package:erevho/features/main/data/repositories/local/user_params_local_repository_impl.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:erevho/features/main/domain/repositories/local/dream_local_repository.dart';
import 'package:erevho/features/main/domain/repositories/local/user_data_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllUserDreamsFilteredUsecaseProvider = Provider(
  (ref) => GetAllUserDreamsFilteredUsecase(
    ref.read(dreamLocalRepositoryProvider),
    ref.read(userDataLocalRepositoryProvider),
  ),
);

class GetAllUserDreamsFilteredUsecase extends Usecase<List<Dream>, GetAllUserDreamsFilteredUsecaseParams> {
  final DreamLocalRepository dreamLocalRepository;
  final UserDataLocalRepository userDataLocalRepository;

  GetAllUserDreamsFilteredUsecase(this.dreamLocalRepository, this.userDataLocalRepository);

  @override
  Future<List<Dream>> perform(GetAllUserDreamsFilteredUsecaseParams params) async {
    final userData = await userDataLocalRepository.getCurrent();

    if (userData == null) {
      throw ("User data can't be found. Can't get dreams object from an object that don't even exists");
    }

    return dreamLocalRepository.getAllFiltered(
      userUuid: userData.uuid,
      title: params.title,
    );
  }
}

class GetAllUserDreamsFilteredUsecaseParams extends Params {
  final String? title;

  GetAllUserDreamsFilteredUsecaseParams({this.title});
}
