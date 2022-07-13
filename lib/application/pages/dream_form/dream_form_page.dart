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
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                        hintText: controller.alt.current.title_form,
                        textFieldType: TextFieldType.title,
                        validator: controller.validateTitle,
                        onSaved: controller.saveTitle,
                      ),
                      const SizedBox(height: 10),

                      /// TODO Item to put here.
                      const SizedBox(height: 30),
                      NightButton(
                        onPressed: () => controller.onSubmit(),
                        text: controller.alt.current.submit,
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
