import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/main/data/repositories/local/dream_local_repository_impl.dart';
import 'package:erevho/features/main/data/repositories/local/user_params_local_repository_impl.dart';
import 'package:erevho/features/main/domain/entities/dreams/chapter.entity.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:erevho/features/main/domain/repositories/local/dream_local_repository.dart';
import 'package:erevho/features/main/domain/repositories/local/user_data_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final addNewDreamUsecaseProvider = Provider(
  (ref) => AddNewDreamUsecase(
    ref.read(dreamLocalRepositoryProvider),
    ref.read(userDataLocalRepositoryProvider),
  ),
);

class AddNewDreamUsecase extends Usecase<Dream, AddNewDreamUsecaseParams> {
  final DreamLocalRepository dreamLocalRepository;
  final UserDataLocalRepository userDataLocalRepository;
  final uuidTool = const Uuid();

  AddNewDreamUsecase(this.dreamLocalRepository, this.userDataLocalRepository);

  @override
  Future<Dream> perform(AddNewDreamUsecaseParams params) async {
    final userData = await userDataLocalRepository.getCurrent();
    if (userData == null) throw ('No data user, can\'t create a dream');
    final uuid = uuidTool.v4();
    final newDream = Dream(
      uuid: uuid,
      pseudonym: userData.pseudonym,
      userUuid: userData.uuid,
      title: params.title,
      chapters: [
        Chapter(
          uuid: uuidTool.v4(),
          number: 1,
          title: '',
          content: '',
          created: DateTime.now(),
          updated: DateTime.now(),
        ),
      ],
      tags: [],
      created: DateTime.now(),
      updated: DateTime.now(),
    );
    dreamLocalRepository.createOne(newDream);
    final createdDream = await dreamLocalRepository.getOne(uuid);
    if (createdDream == null) throw ('Cannot find the created dream');
    return createdDream;
  }
}

class AddNewDreamUsecaseParams extends Params {
  final String title;

  AddNewDreamUsecaseParams(this.title);
}
