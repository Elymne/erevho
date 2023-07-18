import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/main/data/repositories/local/dream_local_repository_impl.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:erevho/features/main/domain/repositories/local/dream_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return result;
  }
}

class GetOneDreamByUuidUsecaseParams extends Params {
  final String uuid;

  GetOneDreamByUuidUsecaseParams(this.uuid);
}
