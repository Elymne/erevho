import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/main/data/repositories/local/dream_local_repository_impl.dart';
import 'package:erevho/features/main/domain/entities/dreams/chapter.entity.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:erevho/features/main/domain/repositories/local/dream_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final getOneDreamByUuidUsecaseProvider = Provider(
  (ref) => GetOneDreamByUuidUsecase(
    ref.read(dreamLocalRepositoryProvider),
  ),
);

class GetOneDreamByUuidUsecase extends Usecase<Dream, GetOneDreamByUuidUsecaseParams> {
  final DreamLocalRepository dreamLocalRepository;

  GetOneDreamByUuidUsecase(this.dreamLocalRepository);

  @override
  Future<Dream> perform(GetOneDreamByUuidUsecaseParams params) async {
    final result = await dreamLocalRepository.getOne(params.uuid);

    if (result == null) throw ('No dream with ID : ${params.uuid}');

    // Dream should always have at least one chapter. If not, we create one while getting a dream with this usecase.
    if (result.chapters.isEmpty) {
      final updatedResult = result.copyWith(chapters: [
        Chapter(
          uuid: const Uuid().v4(),
          title: '',
          content: '',
          created: DateTime.now(),
          updated: DateTime.now(),
        ),
      ]);
      dreamLocalRepository.updateOne(updatedResult);
      final updatedDream = await dreamLocalRepository.getOne(updatedResult.uuid);
      if (updatedDream == null) throw ('Cannot find the updated dream');
      if (updatedDream.chapters.isEmpty) throw ("The added chapter can't be found");
      return updatedDream;
    }

    return result;
  }
}

class GetOneDreamByUuidUsecaseParams extends Params {
  final String uuid;

  GetOneDreamByUuidUsecaseParams(this.uuid);
}
