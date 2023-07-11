import 'package:flutter/material.dart';

class DreamChipTag extends StatelessWidget {
  final String tag;
  final bool _selected = false;

  const DreamChipTag({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputChip(
      selected: _selected,
      label: Text(tag),
      labelStyle: const TextStyle(color: Colors.white),
      backgroundColor: Colors.blueGrey.shade300,
    );
  }
}
