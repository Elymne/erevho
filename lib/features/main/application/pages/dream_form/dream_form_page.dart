import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/widgets/buttons/back_night_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DreamFormPage extends ConsumerWidget {
  final String? dreamId;

  const DreamFormPage({Key? key, required this.dreamId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          ],
        ),
      ),
    );
  }
}
