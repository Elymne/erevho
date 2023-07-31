import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/widgets/forms/erevoh_text_field.dart';
import 'package:flutter/material.dart';

class MainDreamForm extends StatelessWidget {
  final AppLocalisationTools alt;
  final String? dreamTitle;
  final String? Function(String? value) validator;

  final void Function() onContentDreamFormAccess;
  final void Function() onSave;
  final void Function() onPushBack;

  const MainDreamForm({
    super.key,
    required this.validator,
    required this.dreamTitle,
    required this.onContentDreamFormAccess,
    required this.alt,
    required this.onSave,
    required this.onPushBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ErevohTextField(
            expanded: false,
            maxLines: 1,
            labelText: alt.current.dream_form_title_textfield,
            initialValue: dreamTitle,
            validator: (value) => validator(value),
          ),
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          onPressed: () => onContentDreamFormAccess(),
          style: OutlinedButton.styleFrom(
            backgroundColor: erevohBlue,
          ),
          child: const AutoSizeText(
            'Modifier le contenu du rêve',
            style: TextStyle(
              color: erevohWhite,
              fontSize: 24,
            ),
          ),
        ),

        const Expanded(child: SizedBox()),

        /// VALIDATION
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              OutlinedButton(
                onPressed: () => onPushBack(),
                style: OutlinedButton.styleFrom(
                  backgroundColor: erevohRed,
                ),
                child: const AutoSizeText(
                  'Retour',
                  style: TextStyle(
                    color: erevohWhite,
                    fontSize: 24,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              OutlinedButton(
                onPressed: () => onSave(),
                style: OutlinedButton.styleFrom(
                  backgroundColor: erevohGreen,
                ),
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
      ],
    );
  }
}
