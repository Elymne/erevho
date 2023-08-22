import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/home/home_controller.dart';
import 'package:erevho/features/main/application/widgets/buttons/home_menu_button.dart';
import 'package:erevho/features/main/application/widgets/styles/bubble_speak.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<HomePage> {
  late final HomeController controller = ref.read(homeControllerProvider);
  late final AppLocalisationTools alt = ref.read(appLocalisationToolsProvider);

  late final double screenWidth = MediaQuery.of(context).size.width;
  late final double screenHeight = MediaQuery.of(context).size.height;

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    final homeMessage = ref.watch(controller.homeMessageProvider);
    const scafoldBackgroundColor = erevohDark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: scafoldBackgroundColor,
        body: Column(
          children: [
            // App title.
            const SizedBox(height: 10),
            AutoSizeText(
              alt.current.appName,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30),

            // Dreams user's access.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: HomeMenuButton(
                scafoldBackgroundColor: scafoldBackgroundColor,
                animationDuration: 1200,
                text: alt.current.home_dream_access,
                icon: Icons.menu_book_sharp,
                onClick: () => controller.goToUserHomePage(context),
              ),
            ),
            const SizedBox(height: 10.0),

            // Dreams user's access.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: HomeMenuButton(
                scafoldBackgroundColor: scafoldBackgroundColor,
                animationDuration: 2000,
                text: alt.current.home_nearby_dream,
                icon: Icons.bluetooth,
                onClick: () {},
              ),
            ),
            const SizedBox(height: 10.0),

            // Dreams user's access.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: HomeMenuButton(
                scafoldBackgroundColor: scafoldBackgroundColor,
                animationDuration: 1600,
                text: alt.current.home_settings,
                icon: Icons.settings,
                onClick: () {},
              ),
            ),

            const Expanded(child: SizedBox()),

            // LA BUBULE
            BubbleSpeak(
              scafoldBackgroundColor: scafoldBackgroundColor,
              content: Column(
                children: [
                  AutoSizeText.rich(
                    TextSpan(
                      text: homeMessage?.greeting,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: erevohWhite,
                      ),
                      children: [
                        TextSpan(
                          text: homeMessage?.userName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: erevohOrange,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AutoSizeText(
                    homeMessage?.specialMessage ?? '',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: erevohWhite,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Char animation.
            SizedBox(
              height: 140,
              // width: 300,
              child: RiveAnimation.asset(
                "assets/rives/char.riv",
                antialiasing: false,
                fit: BoxFit.fitHeight,
                controllers: [
                  controller.initAnimationController,
                  controller.idlesAnimationController,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
