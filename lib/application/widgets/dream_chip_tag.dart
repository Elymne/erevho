import 'package:erevho/core/extensions/tag_color_extension.dart';
import 'package:erevho/domain/entities/dream/tag.entity.dart';
import 'package:flutter/material.dart';

class DreamChipTag extends StatelessWidget {
  final Tag tag;
  final bool _selected = false;

  const DreamChipTag({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputChip(
      selected: _selected,
      label: Text(tag.title),
      labelStyle: const TextStyle(color: Colors.white),
      backgroundColor: tag.tagColor.color,
    );
  }
}
