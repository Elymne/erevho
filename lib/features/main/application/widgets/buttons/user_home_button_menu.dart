import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';

class UserHomeButtonMenu extends StatefulWidget {
  final void Function() onTap;
  final String imageBackground;
  final String text;

  const UserHomeButtonMenu({
    super.key,
    required this.onTap,
    required this.imageBackground,
    required this.text,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<UserHomeButtonMenu> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        //height: screenHeight / containerDivider,
        decoration: BoxDecoration(
          color: erevohGrey,
          border: Border.all(
            color: erevohBlack,
            width: 1,
          ),
          image: DecorationImage(
            image: AssetImage(widget.imageBackground!),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                //color: erevohBlack.withOpacity(0.5),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: erevohBlack.withOpacity(0.6),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: AutoSizeText(
                  widget.text,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
