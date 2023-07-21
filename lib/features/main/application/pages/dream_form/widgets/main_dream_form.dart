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

  const MainDreamForm({
    super.key,
    required this.validator,
    required this.dreamTitle,
    required this.onContentDreamFormAccess,
    required this.alt,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
