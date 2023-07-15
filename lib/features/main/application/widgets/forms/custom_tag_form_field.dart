import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/widgets/dream_chip_tag.dart';
import 'package:flutter/material.dart';

class CustomTagFormField extends StatefulWidget {
  final List<String> defaultValues;

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
            hintStyle: TextStyle(),
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
