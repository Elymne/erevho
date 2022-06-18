// TODO Gérer les données du formulaire d'un coup enfaite mon gars.
// Et faire une petite interface à la limite, on va voir.
import 'package:erevho/core/form.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';

class DreamForm extends Form<DreamEntity> {
  final String title;
  final String content;
  final List<String> tags;

  DreamForm({required this.title, required this.content, required this.tags});
}
