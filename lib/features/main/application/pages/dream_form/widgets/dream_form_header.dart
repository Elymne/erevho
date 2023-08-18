import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:flutter/material.dart';

class MainDreamFormHeader extends StatefulWidget {
  final AppLocalisationTools alt;

  const MainDreamFormHeader({super.key, required this.alt, required int currentPage});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MainDreamFormHeader> {
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      widget.alt.current.dream_form_title,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
