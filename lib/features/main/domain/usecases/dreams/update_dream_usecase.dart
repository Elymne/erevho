import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateDreamUsecaseProvider = Provider((ref) => UpdateDreamUsecase());

class UpdateDreamUsecase extends Usecase<void, UpdateDreamUsecaseParams> {
  @override
  Future<void> perform(UpdateDreamUsecaseParams params) {
    // TODO: implement perform
    throw UnimplementedError();
  }
}

class UpdateDreamUsecaseParams extends Params {
  final Dream updatedDream;

  UpdateDreamUsecaseParams(this.updatedDream);
}
