import 'package:erevho/application/widgets/custom_form_field.dart';
import 'package:erevho/di/tools/app_localisation_tools.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:erevho/application/pages/dream_form/dream_form_controller.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class DreamFormPage extends ConsumerStatefulWidget {
  final String? dreamId;

  const DreamFormPage({Key? key, this.dreamId}) : super(key: key);

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
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Retour'),
              ),
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
                      isContent: false,
                      validator: (text) {
                        if (text == null) return appLocals.current.title_form_error;
                        if (text == '') return appLocals.current.title_form_error;
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomFormField(
                      hintText: appLocals.current.content_form,
                      isContent: true,
                      validator: (text) {
                        if (text == null) return appLocals.current.content_form_error;
                        if (text == '') return appLocals.current.content_form_error;
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton(
                      onPressed: () => controller.onSubmit(),
                      child: Text(appLocals.current.submit),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
