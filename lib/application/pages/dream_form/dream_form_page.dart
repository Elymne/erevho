import 'package:erevho/application/widgets/buttons/back_night_button.dart';
import 'package:erevho/application/widgets/custom_form_field.dart';
import 'package:erevho/application/widgets/buttons/night_button.dart';
import 'package:erevho/di/tools/app_localisation_tools.dart';
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
  final AppLocalisationTools appLocals = GetIt.instance();

  @override
  void initState() {
    super.initState();
    controller.init(context, ref, DreamFormParam(id: widget.dreamId));
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    CustomFormField(
                      hintText: appLocals.current.title_form,
                      textFieldType: TextFieldType.title,
                      validator: controller.validateTitle,
                      onSaved: controller.saveTitle,
                    ),
                    const SizedBox(height: 10),
                    CustomFormField(
                      hintText: appLocals.current.content_form,
                      textFieldType: TextFieldType.content,
                      validator: controller.validateContent,
                      onSaved: controller.saveContent,
                    ),
                    const SizedBox(height: 30),
                    NightButton(
                      onPressed: () => controller.onSubmit(),
                      text: appLocals.current.submit,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
