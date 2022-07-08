// TODO Gérer les données du formulaire d'un coup enfaite mon gars.
// Et faire une petite interface à la limite, on va voir.
import 'package:erevho/core/form.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';

/// Attributes aren't final because I need to mutate them.
class DreamForm extends Form<DreamEntity> {
  String title;
  String content;
  List<String> tags;

  DreamForm({required this.title, required this.content, required this.tags});

  factory DreamForm.fromEntity(DreamEntity dreamEntity) {
    return DreamForm(title: dreamEntity.title, content: '', tags: dreamEntity.tags.map((e) => e.title).toList());
  }
}
