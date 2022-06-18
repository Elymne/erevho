import 'package:erevho/application/pages/dream_form/dream_form_controller.dart';
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

  @override
  void initState() {
    super.initState();
    controller.init(context, ref, DreamFormParam(id: widget.dreamId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {},
              child: const Text('FORMULAIRE LEL'),
            ),
          ],
        ),
      ),
    );
  }
}
