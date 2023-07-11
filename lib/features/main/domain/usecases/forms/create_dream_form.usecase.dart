import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createDreamFormUseCaseProvider = Provider((_) => CreateDreamForm());

class CreateDreamForm extends Usecase<Dream, CreateDreamFormUseCaseParams> {
  @override
  Future<Dream> perform(CreateDreamFormUseCaseParams params) {
    // TODO: implement perform
    throw UnimplementedError();
  }
}

class CreateDreamFormUseCaseParams extends Params {
  final String? id;

  CreateDreamFormUseCaseParams({this.id});
}
