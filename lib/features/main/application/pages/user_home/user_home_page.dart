import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/user_home/pages/user_main_home/user_main_home_page.dart';
import 'package:erevho/features/main/application/pages/user_home/user_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/user_add_dream/user_add_dream_page.dart';
import 'pages/user_dreams_list/user_dreams_list_page.dart';

class UserHomePage extends ConsumerStatefulWidget {
  const UserHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<UserHomePage> {
  late final UserHomeController controller = ref.read(userHomeControllerProvider);
  late final AppLocalisationTools alt = ref.read(appLocalisationToolsProvider);

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(controller.currentPageProvider);
    final currentTitleText = ref.watch(controller.currentTitleTextProvider);
    final isTopContentVisible = ref.watch(controller.isTopContentVisibleProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: erevohDark,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Column(
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isTopContentVisible ? 1.0 : 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const SizedBox(height: 60), // Just to minimize the jump effect when changing current page.
                        if (currentPage == 2)
                          ElevatedButton(
                            onPressed: () => controller.goToMainHomePage(),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: erevohOrange,
                              fixedSize: const Size(40, 40),
                            ),
                            child: const Icon(Icons.arrow_left_outlined),
                          ),
                        if (currentPage == 2 || currentPage == 1) const Expanded(child: SizedBox()),
                        AutoSizeText(
                          currentTitleText,
                          style: const TextStyle(fontSize: 30),
                        ),
                        if (currentPage == 0 || currentPage == 1) const Expanded(child: SizedBox()),
                        if (currentPage == 0)
                          ElevatedButton(
                            onPressed: () => controller.goToMainHomePage(),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: erevohOrange,
                              fixedSize: const Size(40, 40),
                            ),
                            child: const Icon(Icons.arrow_right_outlined),
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const UserAddDreamPage(),
                      UserMainHomePage(
                        onFirstContainerTap: () {
                          controller.goToListPage();
                        },
                        onSecondContainerTap: () {
                          controller.goToCreatePage();
                        },
                      ),
                      const UserDreamsListPage(),
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
