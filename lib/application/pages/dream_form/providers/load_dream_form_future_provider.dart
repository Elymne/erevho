import 'package:erevho/application/pages/dream_form/forms/chapter_form.dart';
import 'package:erevho/application/pages/dream_form/forms/dream_form.dart';
import 'package:erevho/domain/usecases/dream/get_one_dream_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

/// I use this provider to fetch dream data in case we are updating one of them.
/// The fetch is async so I have to use a FutureProvider.
/// I have the same page/widget for creating or updating a dream, that why I use this even for creating one
/// (I don't use async function inside but anyways, it's still a FutureProvider that will create my form data).
final loadFormFutureProvider = FutureProvider.autoDispose.family<DreamForm, String?>((ref, id) async {
  final GetOneDreamUsecase getOneDreamUsecase = GetIt.I();
  if (id != null) return DreamForm.fromEntity(await getOneDreamUsecase.perform(GetOneDreamParams(id)));
  return DreamForm(title: '', chapters: [ChapterForm(title: '', number: 0, content: '', isInit: false)], tags: []);
});
