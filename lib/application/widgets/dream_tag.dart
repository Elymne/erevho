import 'package:erevho/core/extensions/tag_color_extension.dart';
import 'package:erevho/domain/entities/dream/tag_entity.dart';
import 'package:flutter/material.dart';

class DreamTag extends StatelessWidget {
  final TagEntity tag;

  const DreamTag({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: tag.tagColor.color, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(tag.title, style: const TextStyle(fontSize: 8)),
      ),
    );
  }
}
