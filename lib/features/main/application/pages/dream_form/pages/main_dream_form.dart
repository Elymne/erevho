import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/widgets/forms/erevoh_dream_title_textfield.dart';
import 'package:flutter/material.dart';

class MainDreamForm extends StatelessWidget {
  final AppLocalisationTools alt;
  final String? dreamTitle;

  final String? Function(String? value) validator;
  final void Function(String value) onDreamTitleChange;

  final void Function() onSave;
  final void Function() onCancel;

  const MainDreamForm({
    super.key,
    required this.dreamTitle,
    required this.alt,
    required this.validator,
    required this.onDreamTitleChange,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ErevohDreamTitleTextField(
            title: alt.current.dream_form_title_textfield,
            initialValue: dreamTitle,
            validator: (value) => validator(value),
            onChange: (value) => onDreamTitleChange(value),
          ),
        ),
        const SizedBox(height: 20),
        const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: erevohRed,
                ),
                onPressed: () => onCancel(),
                child: const AutoSizeText(
                  'Annuler',
                  style: TextStyle(
                    color: erevohWhite,
                    fontSize: 24,
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: erevohGreen,
                ),
                onPressed: () => onSave(),
                child: const AutoSizeText(
                  'Sauvegarder',
                  style: TextStyle(
                    color: erevohWhite,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
