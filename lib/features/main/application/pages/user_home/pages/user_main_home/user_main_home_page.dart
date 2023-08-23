import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/features/main/application/pages/user_home/pages/user_main_home/user_main_home_controller.dart';
import 'package:erevho/features/main/application/widgets/buttons/user_home_button_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserMainHomePage extends ConsumerStatefulWidget {
  final Function() onFirstContainerTap;
  final Function() onSecondContainerTap;
  final Function() onPushBack;

  const UserMainHomePage({
    super.key,
    required this.onFirstContainerTap,
    required this.onSecondContainerTap,
    required this.onPushBack,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<UserMainHomePage> {
  late UserMainHomeController controller = ref.read(userMainHomeController);
  late AppLocalisationTools alt = ref.read(appLocalisationToolsProvider);

  late final double screenHeight = MediaQuery.of(context).size.height;
  final double containerDivider = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        // Main page.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: UserHomeButtonMenu(
            onTap: () => widget.onFirstContainerTap(),
            text: alt.current.home_user_dream_list_access,
            imageBackground: "assets/images/NatureMorteUn.jpg",
          ),
        ),
        const SizedBox(height: 10),

        // Containers clickable.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: UserHomeButtonMenu(
            onTap: () => widget.onSecondContainerTap(),
            text: alt.current.home_user_add_dream_access,
            imageBackground: "assets/images/NatureMorteDeux.jpeg",
          ),
        ),
        const SizedBox(height: 10),

        // Containers clickable.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: UserHomeButtonMenu(
            onTap: () => widget.onPushBack(),
            text: alt.current.back,
            imageBackground: "assets/images/back.jpg",
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
