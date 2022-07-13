import 'package:erevho/domain/entities/dream/chapter_entity.dart';

class ChapterForm {
  String title;
  int number;
  String content;
  bool isInit;

  ChapterForm({required this.title, required this.number, required this.content, required this.isInit});

  factory ChapterForm.fromEntity(ChapterEntity chapterEntity) {
    return ChapterForm(title: chapterEntity.title, number: chapterEntity.number, content: chapterEntity.content, isInit: true);
  }
}
