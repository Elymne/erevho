import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/dream_form/dream_form_controller.dart';
import 'package:erevho/features/main/application/pages/dream_form/widgets/content_dream_form.dart';
import 'package:erevho/features/main/application/pages/dream_form/widgets/main_dream_form.dart';
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
        backgroundColor: erevohDark,
        body: Form(
          key: controller.formKey,
          child: PageView(
            controller: controller.pageController,
            children: [
              MainDreamForm(
                alt: alt,
                validator: (value) => controller.validateDreamTitle(value),
                dreamTitle: dream.title,
                onContentDreamFormAccess: () => controller.goToContentFormPage(),
              ),
              ContentDreamForm(
                alt: alt,
                dream: dream,
                validateDreamChapter: (index, value) => controller.validateDreamChapter(index, value),
                validateDreamContent: (index, value) => controller.validateDreamContent(index, value),
                onMainDreamFormAccess: () => controller.goToMainFormPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
