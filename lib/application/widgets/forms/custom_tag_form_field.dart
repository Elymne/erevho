import 'package:erevho/application/widgets/dream_chip_tag.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/domain/entities/dream/tag.entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTagFormField extends StatefulWidget {
  final List<Tag> defaultValues;

  const CustomTagFormField({Key? key, required this.defaultValues}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CustomTagFormFieldState();
}

class CustomTagFormFieldState extends State<CustomTagFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: buildTags()),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: 1,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            hintStyle: GoogleFonts.robotoFlex(),
            hintText: 'Tags',
            fillColor: nightGreyDarker,
          ),
          validator: (text) => null,
        ),
      ],
    );
  }

  List<DreamChipTag> buildTags() {
    return widget.defaultValues.map((tag) => DreamChipTag(tag: tag)).toList();
  }
}
