import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';

class ChapterFormAdd extends StatelessWidget {
  final AppLocalisationTools alt;
  final Function() onChapterAdd;

  const ChapterFormAdd({
    super.key,
    required this.alt,
    required this.onChapterAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => onChapterAdd(),
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            border: Border.fromBorderSide(BorderSide(
              color: erevohWhite,
              width: 1,
            )),
          ),
          child: const Icon(Icons.add, size: 40),
        ),
      ),
    );
  }
}
