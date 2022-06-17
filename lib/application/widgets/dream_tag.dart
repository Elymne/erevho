import 'package:erevho/core/extensions/tag_color_extension.dart';
import 'package:erevho/domain/entities/dream/tag_entity.dart';
import 'package:flutter/material.dart';

class DreamTag extends StatelessWidget {
  final TagEntity tag;

  const DreamTag({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: tag.tagColor.shadowColor,
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            tag.tagColor.color,
            tag.tagColor.darkColor,
          ],
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Text(tag.title, style: const TextStyle(fontSize: 10)),
      ),
    );
  }
}
