import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/widgets/dream_chip_tag.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:flutter/material.dart';

class DreamCard extends StatelessWidget {
  final Dream dream;

  const DreamCard({Key? key, required this.dream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: erevohBlue,
        boxShadow: const [
          BoxShadow(
            color: erevohDark,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Image.asset(
              'assets/images/test.jpg',
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(dream.title, style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 4),
            child: Text(dream.created.toString(), style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 12, bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: dream.tags
                  .map(
                    (tag) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: DreamChipTag(tag: tag),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
