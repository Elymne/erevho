import 'package:erevho/domain/usecases/dream/get_all_dreams_usecase.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

/// This provider get data from Dream table and use Params from Usecase architecture to filter datas.
final dreamsFutureProvider = FutureProvider.autoDispose.family<List<DreamEntity>, String?>((ref, text) async {
  final GetAllDreamsUsecase getAllDreamsUsecase = GetIt.I();
  final getAllDreamsParams = GetAllDreamsParams(title: text);
  return await getAllDreamsUsecase.perform(getAllDreamsParams);
});
