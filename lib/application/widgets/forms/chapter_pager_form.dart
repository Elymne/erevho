import 'package:erevho/application/pages/dream_form/dream_form.dart';
import 'package:erevho/application/widgets/forms/custom_form_field.dart';
import 'package:erevho/di/tools/app_localisation_tools.dart';
import 'package:erevho/domain/entities/dream/chapter_entity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ChapterPagerForm extends StatefulWidget {
  final List<ChapterEntity> chapters;

  const ChapterPagerForm({Key? key, required this.chapters}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChapterPagerFormState();
}

class ChapterPagerFormState extends State<ChapterPagerForm> {
  /// Translation service.
  final AppLocalisationTools alt = GetIt.I();
  List<ChapterForm> chapters = [];

  @override
  void initState() {
    super.initState();
    chapters = widget.chapters.map((e) => ChapterForm.fromEntity(e)).toList();
    chapters.add(ChapterForm(title: '', number: chapters.length + 1, content: '', isInit: false));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title textfield.
        PageView.builder(
          itemCount: chapters.length,
          itemBuilder: (context, index) {
            if (chapters[index].isInit) {
              return CustomFormField(
                hintText: alt.current.chapter_title_form,
                textFieldType: TextFieldType.title,
                initialValue: chapters[index].title,
                validator: (text) => 'PAS b1 gaidjdfjfhek',
                onSaved: (text) {},
              );
            }
            return Text('AJOUTER');
          },
        ),
        // Content textfield.
        Expanded(
          child: PageView.builder(
            itemCount: chapters.length,
            itemBuilder: (context, index) {
              if (chapters[index].isInit) {
                return CustomFormField(
                  hintText: alt.current.chapter_content_form,
                  textFieldType: TextFieldType.title,
                  initialValue: chapters[index].content,
                  validator: (text) => 'PAS b1 gaidjdfjfhek',
                  onSaved: (text) {},
                );
              }
              return OutlinedButton(
                onPressed: () {},
                child: Text('Ajouter'),
              );
            },
          ),
        ),
      ],
    );
  }
}
