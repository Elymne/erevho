import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';

class BackNightButton extends StatelessWidget {
  final BuildContext context;

  const BackNightButton({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pop(context),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const CircleBorder()),
        padding: MaterialStateProperty.all(const EdgeInsets.all(18)),
        backgroundColor: MaterialStateProperty.all(nightOrange), // <-- Button color
      ),
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: pureWhite,
      ),
    );
  }
}
