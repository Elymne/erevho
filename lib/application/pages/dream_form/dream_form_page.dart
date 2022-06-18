import 'package:erevho/application/pages/dream_form/dream_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class DreamFormPage extends ConsumerWidget {
  final DreamFormController controller = GetIt.instance();
  final String? dreamId;

  DreamFormPage({Key? key, this.dreamId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: OutlinedButton(
        onPressed: () {},
        child: const Text('FORMULAIRE LEL'),
      ),
    );
  }
}
