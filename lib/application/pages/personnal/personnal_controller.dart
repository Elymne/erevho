import 'package:erevho/application/navigation/app_router.dart';
import 'package:erevho/application/navigation/routes.dart';
import 'package:erevho/core/controller.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/usecases/dream/get_all_dreams_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PersonnalController extends StatefulController {
  final GetAllDreamsUsecase getAllDreamsUsecase;
  final AppRouter appRouter;

  // Private state TextField.
  String? _textfieldValue;

  // State watchers.
  late final _dreamsProvider = FutureProvider<List<DreamEntity>>((ref) async {
    return await getAllDreamsUsecase.perform(GetAllDreamsParams());
  });
  AsyncValue<List<DreamEntity>> get dreams => ref.watch(_dreamsProvider);

  PersonnalController(this.getAllDreamsUsecase, this.appRouter);

  void onSubmitted(String text) {
    _textfieldValue = text;
    ref.refresh(_dreamsProvider);
  }

  void accessToCreateDreamFormPage() {
    appRouter.navigate(context, '$dreamForm/none');
  }
}
