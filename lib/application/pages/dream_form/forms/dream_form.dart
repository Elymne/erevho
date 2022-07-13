import 'package:erevho/application/pages/dream_form/forms/chapter_form.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';

class DreamForm {
  String title;
  List<ChapterForm> chapters;
  List<String> tags;

  DreamForm({required this.title, required this.chapters, required this.tags});

  factory DreamForm.fromEntity(DreamEntity dreamEntity) {
    return DreamForm(
      title: dreamEntity.title,
      chapters: dreamEntity.chapters.map((e) => ChapterForm.fromEntity(e)).toList(),
      tags: dreamEntity.tags.map((e) => e.title).toList(),
    );
  }
}
