import 'package:erevho/core/controller.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/usecases/dream/get_all_dreams_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PersonnalController extends StatefulController {
  final GetAllDreamsUsecase getAllDreamsUsecase;
  final StateProvider<List<DreamEntity>> dreamsProvider = StateProvider((ref) => []);

  PersonnalController(this.getAllDreamsUsecase);

  @override
  void init(BuildContext context, WidgetRef ref) async {
    super.init(context, ref);
    ref.read(dreamsProvider.state).state = await getAllDreamsUsecase.perform(GetAllDreamsParams());
    print('Data loaded');
  }
}
