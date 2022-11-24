import 'package:erevho/domain/entities/dream/dream.entity.dart';
import 'package:erevho/domain/entities/forms/chapter_form.dart';

class DreamForm {
  String title;
  List<ChapterForm> chapters;
  List<String> tags;

  DreamForm({required this.title, required this.chapters, required this.tags});

  factory DreamForm.fromEntity(Dream dreamEntity) {
    return DreamForm(
      title: dreamEntity.title,
      chapters: dreamEntity.chapters.map((e) => ChapterForm.fromEntity(e)).toList(),
      tags: dreamEntity.tags.map((e) => e.title).toList(),
    );
  }
}
