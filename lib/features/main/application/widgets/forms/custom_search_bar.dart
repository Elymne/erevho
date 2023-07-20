import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSearchBar extends ConsumerWidget {
  final void Function(String text) onSubmitted;

  const CustomSearchBar({Key? key, required this.onSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalisationTools appLocals = ref.watch(appLocalisationToolsProvider);

    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        hintText: appLocals.current.dream_form_title_textfield,
        filled: true,
        fillColor: erevohDark,
      ),
      onSubmitted: (text) => onSubmitted(text),
    );
  }
}
