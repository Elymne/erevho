import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/features/main/application/pages/dream_form/dream_form_controller.dart';
import 'package:erevho/features/main/application/widgets/forms/erevoh_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DreamFormPage extends ConsumerStatefulWidget {
  final String? newTitle;
  final String? dreamUuid;

  const DreamFormPage({super.key, this.newTitle, this.dreamUuid});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<DreamFormPage> {
  late final DreamFormController controller = ref.read(dreamFormControllerProvider);
  late final AppLocalisationTools alt = ref.read(appLocalisationToolsProvider);

  @override
  void initState() {
    super.initState();
    controller.init(context, newTitle: widget.newTitle, dreamUuid: widget.dreamUuid);
  }

  @override
  Widget build(BuildContext context) {
    final dream = ref.watch(controller.dreamProvider);

    if (dream == null) {
      return const Center(
        child: Text("loading"),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              AutoSizeText(
                alt.current.dream_form_title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ErevohTextField(
                  labelText: alt.current.dream_form_title_textfield,
                  initialValue: dream.title,
                  validator: (value) => controller.validateDreamTitle(value),
                ),
              ),
              const SizedBox(height: 20),

              //
              Expanded(
                child: PageView.builder(
                  itemCount: dream.chapters.length + 1,
                  itemBuilder: ((context, index) {
                    if (index > dream.chapters.length) {
                      return Center(
                        child: Text("ADD ONE CHAPTER LEL"),
                      );
                    }

                    return ErevohTextField(
                      labelText: alt.current.dream_form_title_textfield,
                      initialValue: dream.title,
                      validator: (value) => controller.validateDreamTitle(value),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
