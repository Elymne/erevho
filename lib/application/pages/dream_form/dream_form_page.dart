import 'package:erevho/application/widgets/buttons/back_night_button.dart';
import 'package:erevho/application/widgets/forms/custom_form_field.dart';
import 'package:erevho/application/widgets/buttons/night_button.dart';
import 'package:erevho/application/pages/dream_form/dream_form_controller.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class DreamFormPage extends ConsumerStatefulWidget {
  final String? dreamId;

  const DreamFormPage({Key? key, required this.dreamId}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => DreamFormState();
}

class DreamFormState extends ConsumerState<DreamFormPage> {
  final DreamFormController controller = GetIt.instance();

  @override
  void initState() {
    super.initState();
    controller.init(context: context, ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nightGrey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: BackNightButton(context: context),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: controller.loadFormValue(widget.dreamId).when(
                      error: (err, stacktrace) => const Center(child: Text('ERROR')),
                      loading: () => const Center(child: Text('LOADING')),
                      data: (dreamForm) {
                        controller.setDreamFormValue(dreamForm);
                        return Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              CustomFormField(
                                initialValue: controller.dreamFormValue.title,
                                hintText: controller.alt.current.title_form,
                                textFieldType: TextFieldType.title,
                                validator: controller.validateTitle,
                                onSaved: controller.saveTitle,
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 40,
                                child: PageView.builder(
                                  itemCount: controller.dreamFormValue.chapters.length,
                                  itemBuilder: (context, index) {
                                    if (controller.dreamFormValue.chapters[index].isInit) {
                                      return CustomFormField(
                                        hintText: controller.alt.current.chapter_title_form,
                                        textFieldType: TextFieldType.title,
                                        initialValue: controller.dreamFormValue.chapters[index].title,
                                        validator: (text) => 'PAS b1 gaidjdfjfhek',
                                        onSaved: (text) {},
                                      );
                                    }
                                    return Center(child: Text(controller.alt.current.add_chapter_form));
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: PageView.builder(
                                  itemCount: controller.dreamFormValue.chapters.length,
                                  itemBuilder: (context, index) {
                                    if (controller.dreamFormValue.chapters[index].isInit) {
                                      return CustomFormField(
                                        hintText: controller.alt.current.chapter_content_form,
                                        textFieldType: TextFieldType.title,
                                        initialValue: controller.dreamFormValue.chapters[index].content,
                                        validator: (text) => 'PAS b1 gaidjdfjfhek',
                                        onSaved: (text) {},
                                      );
                                    }
                                    return OutlinedButton(
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.add,
                                        color: pureWhite,
                                        size: 100,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 30),
                              NightButton(
                                onPressed: () => controller.onSubmit(),
                                text: controller.alt.current.submit,
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        );
                      },
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
