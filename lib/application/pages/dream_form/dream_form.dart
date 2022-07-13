import 'package:erevho/core/form.dart';
import 'package:erevho/domain/entities/dream/chapter_entity.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';

class DreamForm extends Form<DreamEntity> {
  String title;
  String content;
  List<String> tags;

  DreamForm({required this.title, required this.content, required this.tags});

  factory DreamForm.fromEntity(DreamEntity dreamEntity) {
    return DreamForm(title: dreamEntity.title, content: '', tags: dreamEntity.tags.map((e) => e.title).toList());
  }
}

class ChapterForm extends Form<ChapterEntity> {
  String title;
  int number;
  String content;
  bool isInit;

  ChapterForm({required this.title, required this.number, required this.content, required this.isInit});

  factory ChapterForm.fromEntity(ChapterEntity chapterEntity) {
    return ChapterForm(title: chapterEntity.title, number: chapterEntity.number, content: chapterEntity.content, isInit: true);
  }
}
