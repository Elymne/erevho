import 'package:erevho/application/pages/dream_form/dream_form.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/usecases/dream/get_all_dreams_usecase.dart';
import 'package:erevho/domain/usecases/dream/get_one_dream_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

/// This provider get data from Dream table and use Params from Usecase architecture to filter datas.
final dreamsFutureProvider = FutureProvider.family<List<DreamEntity>, DreamFutureProviderParams>((ref, params) async {
  final GetAllDreamsUsecase getAllDreamsUsecase = GetIt.I();
  final getAllDreamsParams = GetAllDreamsParams(title: params.textfieldValue);
  return await getAllDreamsUsecase.perform(getAllDreamsParams);
});

/// Params for [dreamsFutureProvider] provider.
class DreamFutureProviderParams {
  final String? textfieldValue;
  const DreamFutureProviderParams({this.textfieldValue});
}

/// Watch the state of form data.
/// Depending of create or update from, we want different data.
/// When [id] is null, we return a empty data structure form (createForm then).
final dreamFormFutureProvider = FutureProvider.family<DreamForm, DreamFormFutureProviderParams>((ref, params) async {
  final GetOneDreamUsecase getOneDreamUsecase = GetIt.I();
  if (params.id != null) return DreamForm.fromEntity(await getOneDreamUsecase.perform(GetOneDreamParams(params.id!)));
  return DreamForm(title: '', content: '', tags: []);
});

/// Params for [dreamsFutureProvider] provider.
class DreamFormFutureProviderParams {
  final String? id;
  const DreamFormFutureProviderParams({this.id});
}
