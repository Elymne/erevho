import 'package:erevho/application/pages/dream_form/dream_form.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/usecases/dream/get_all_dreams_usecase.dart';
import 'package:erevho/domain/usecases/dream/get_one_dream_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

/// This provider get data from Dream table and use Params from Usecase architecture to filter datas.
final dreamsFutureProvider = FutureProvider.family<List<DreamEntity>, GetAllDreamsParams>((ref, params) async {
  final GetAllDreamsUsecase getAllDreamsUsecase = GetIt.I();
  return await getAllDreamsUsecase.perform(params);
});

/// Watch the state of form data.
/// Depending of create or update from, we want different data.
/// When [id] is null, we return a empty data structure form (createForm then).
final dreamFormFutureProvider = FutureProvider.family<DreamForm, String?>((ref, id) async {
  final GetOneDreamUsecase getOneDreamUsecase = GetIt.I();
  if (id != null) return DreamForm.fromEntity(await getOneDreamUsecase.perform(GetOneDreamParams(id)));
  return DreamForm(title: '', content: '', tags: []);
});
