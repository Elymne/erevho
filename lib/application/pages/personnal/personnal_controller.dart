import 'package:erevho/core/controller.dart';
import 'package:erevho/data/models/dream/dream_model.dart';
import 'package:erevho/data/models/dream/tag_model.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/entities/dream/tag_entity.dart';
import 'package:erevho/domain/usecases/dream/get_all_dreams_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PersonnalController extends StatefulController {
  final GetAllDreamsUsecase getAllDreamsUsecase;

  // State watchers.
  late final _dreamsProvider = FutureProvider<List<DreamModel>>((ref) async {
    //return getAllDreamsUsecase.perform(GetAllDreamsParams()) as List<DreamModel>;
    return _lecheater;
  });
  AsyncValue<List<DreamModel>> get dreams => ref.watch(_dreamsProvider);

  PersonnalController(this.getAllDreamsUsecase);

  /// TODO Virer ce truc une fois les tests terminés ok p'tit batard ?
  List<DreamModel> get _lecheater => [
        DreamModel(
          id: "1",
          pseudonym: "cucu",
          title: "Rêve de merde enfait",
          content: "content",
          dreamType: DreamType.todo,
          tags: [
            const TagModel(id: "22", title: "Bizarre", tagColor: TagColor.blue),
            const TagModel(id: "22", title: "NSFW", tagColor: TagColor.red),
            const TagModel(id: "22", title: "Jambon", tagColor: TagColor.green),
            const TagModel(id: "22", title: "Green", tagColor: TagColor.orange),
          ],
          created: DateTime.now(),
        ),
        DreamModel(
          id: "2",
          pseudonym: "pseudonym",
          title: "Je bidule",
          content: "content",
          dreamType: DreamType.todo,
          tags: [],
          created: DateTime.now(),
        ),
      ];
}
