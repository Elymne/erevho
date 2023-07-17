import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/user_home/user_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages/user_dreams_list/user_dreams_list_page.dart';

class UserHomePage extends ConsumerStatefulWidget {
  const UserHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<UserHomePage> {
  late final controller = ref.read(userHomeControllerProvider);
  late final alt = ref.read(appLocalisationToolsProvider);

  late final double screenWidth = MediaQuery.of(context).size.width;
  late final double screenHeight = MediaQuery.of(context).size.height;
  final double containerDivider = 5;

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: erevohDark,
        body: Stack(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: AutoSizeText(
                    'Ton profils wallouh',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    children: [
                      const UserDreamsListPage(),
                      Column(
                        children: [
                          // Main page.
                          GestureDetector(
                            onTap: () {
                              controller.goToListPage();
                            },
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
                              child: const Center(
                                child: AutoSizeText(
                                  'Liste des rêves',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Containers clickable.
                          GestureDetector(
                            onTap: () => null,
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
                              child: const Center(
                                child: AutoSizeText(
                                  "Ajouter un rêve",
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
