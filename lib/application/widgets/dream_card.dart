import 'package:erevho/application/widgets/dream_tag.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/data/models/dream/dream_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DreamCard extends StatelessWidget {
  final DreamModel dream;

  const DreamCard({Key? key, required this.dream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: nightGreyLight,
          boxShadow: const [
            BoxShadow(
              color: nightGreyShadow,
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
              child: Text(dream.title, style: GoogleFonts.robotoFlex(fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 8),
              child: Text(dream.created.toString(), style: GoogleFonts.robotoFlex(fontSize: 14, fontStyle: FontStyle.italic)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 8),
              child: dream.tags.isNotEmpty ? DreamTag(tag: dream.tags[0]) : null,
            ),
          ],
        ),
      ),
    );
  }
}
