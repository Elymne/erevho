import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/features/main/application/pages/dream_form/dream_form_controller.dart';
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
  late final controller = ref.read(dreamFormControllerProvider);

  @override
  void initState() {
    super.initState();
    controller.init(context, newTitle: widget.newTitle, dreamUuid: widget.dreamUuid);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: AutoSizeText('FORM DREAM'),
      )),
    );
  }
}
