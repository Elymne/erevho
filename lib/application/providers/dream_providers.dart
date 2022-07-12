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
/// Set params to null to get default form (without any data, create form simply).
final dreamFormProvider = FutureProvider.family<DreamForm, GetOneDreamParams?>((ref, params) async {
  final GetOneDreamUsecase getOneDreamUsecase = GetIt.I();
  if (params != null) return DreamForm.fromEntity(await getOneDreamUsecase.perform(params));
  return DreamForm(title: '', content: '', tags: []);
});
