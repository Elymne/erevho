import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/dreams/data/repositories/local/dream_local_repository_impl.dart';
import 'package:erevho/features/dreams/domain/entities/dream/dream.entity.dart';
import 'package:erevho/features/dreams/domain/repositories/local/dream_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getOneDreamProvider = FutureProvider.autoDispose.family<Dream, GetOneDreamParams>((ref, arg) {
  final usecase = GetOneDream(ref.read(dreamLocalRepositoryProvider));
  return usecase.perform(arg);
});

/// Usecase to get a detailed dream when user want to access to read one.
/// ex: user click on a dream from list to access to detailed page.
class GetOneDream extends Usecase<Dream, GetOneDreamParams> {
  final DreamLocalRepository dreamLocalRepository;
  GetOneDream(this.dreamLocalRepository);

  @override
  Future<Dream> perform(GetOneDreamParams params) async {
    try {
      return dreamLocalRepository.getOne(params.id);
    } catch (e) {
      throw ('Error: $e');
    }
  }
}

class GetOneDreamParams extends Params {
  final String id;
  const GetOneDreamParams(this.id);
}
