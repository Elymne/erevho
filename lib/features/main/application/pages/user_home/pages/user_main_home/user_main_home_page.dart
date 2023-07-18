import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/user_home/pages/user_main_home/user_main_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserMainHomePage extends ConsumerStatefulWidget {
  final Function() onFirstContainerTap;
  final Function() onSecondContainerTap;

  const UserMainHomePage({
    super.key,
    required this.onFirstContainerTap,
    required this.onSecondContainerTap,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<UserMainHomePage> {
  late UserMainHomeController controller = ref.read(userMainHomeController);
  late AppLocalisationTools alt = ref.read(appLocalisationToolsProvider);

  late final double screenWidth = MediaQuery.of(context).size.width;
  late final double screenHeight = MediaQuery.of(context).size.height;
  final double containerDivider = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main page.
        GestureDetector(
          onTap: () => widget.onFirstContainerTap(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: screenHeight / containerDivider,
            decoration: BoxDecoration(
              color: erevohGrey,
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              border: Border.all(
                color: erevohBlack.withOpacity(0.6),
                width: 2,
              ),
            ),
            child: Center(
              child: AutoSizeText(
                alt.current.home_user_dream_list_access,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Containers clickable.
        GestureDetector(
          onTap: () => widget.onSecondContainerTap(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: screenHeight / containerDivider,
            decoration: BoxDecoration(
              color: erevohGrey,
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              border: Border.all(
                color: erevohBlack.withOpacity(0.6),
                width: 2,
              ),
            ),
            child: Center(
              child: AutoSizeText(
                alt.current.home_user_add_dream_access,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
