import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/data/repositories/local/dream_local_repository_impl.dart';
import 'package:erevho/domain/repositories/local/dream_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteAllDreamsProvider = FutureProvider.autoDispose.family<int, DeleteAllDreamsParams>((ref, arg) {
  final usecase = DeleteAllDreamsUsecase(ref.read(dreamLocalRepositoryProvider));
  return usecase.perform(arg);
});

/// Usecase to delete a list of Dreams created by user.
/// Possibility to delete multiple dreams in one hit.
/// ex: user just click to the trash icon from dream list and validate his selection.
/// ex: user delete a dream from the detailed dream.
class DeleteAllDreamsUsecase extends Usecase<int, DeleteAllDreamsParams> {
  final DreamLocalRepository dreamLocalRepository;

  DeleteAllDreamsUsecase(this.dreamLocalRepository);

  @override
  Future<int> perform(DeleteAllDreamsParams params) async {
    try {
      dreamLocalRepository.deleteAll(params.ids);
      return params.ids.length;
    } catch (e) {
      throw ('Errro: $e');
    }
  }
}

class DeleteAllDreamsParams extends Params {
  final List<String> ids;
  const DeleteAllDreamsParams(this.ids);
}
