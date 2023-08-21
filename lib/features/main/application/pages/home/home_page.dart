import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/home/home_controller.dart';
import 'package:erevho/features/main/application/widgets/buttons/home_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<HomePage> {
  late final HomeController controller = ref.read(homeControllerProvider);

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
            // Start text.
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AutoSizeText.rich(
                TextSpan(
                  text: homeMessage?.greeting,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  ),
                  children: [
                    TextSpan(
                      text: homeMessage?.userName,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: erevohOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AutoSizeText(
                homeMessage?.specialMessage ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            // Dreams user's access.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: HomeMenuButton(
                scafoldBackgroundColor: scafoldBackgroundColor,
                animationDuration: 1200,
                text: "Acces aux rêves",
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
                text: "Autour de moi",
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
                text: "Paramètres",
                onClick: () {},
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
