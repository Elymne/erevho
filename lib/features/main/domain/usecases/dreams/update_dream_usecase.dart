import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/main/data/repositories/local/dream_local_repository_impl.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:erevho/features/main/domain/repositories/local/dream_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateDreamUsecaseProvider = Provider((ref) => UpdateDreamUsecase(ref.read(dreamLocalRepositoryProvider)));

class UpdateDreamUsecase extends Usecase<void, UpdateDreamUsecaseParams> {
  final DreamLocalRepository dreamLocalRepository;

  UpdateDreamUsecase(this.dreamLocalRepository);

  @override
  Future<void> perform(UpdateDreamUsecaseParams params) async {
    dreamLocalRepository.updateOne(params.updatedDream);
  }
}

class UpdateDreamUsecaseParams extends Params {
  final Dream updatedDream;

  UpdateDreamUsecaseParams(this.updatedDream);
}
