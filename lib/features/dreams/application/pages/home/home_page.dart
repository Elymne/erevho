import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/dreams/application/pages/home/home_controller.dart';
import 'package:erevho/features/dreams/application/widgets/layouts/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// TODO rename cette page, y aura pas de home sur l'app. Ou peut-être que si, si rien n'est sélectionné sur la bottombar en partant du principe que c'est possible.
/// Dans quel cas, réfléchir à ce que l'on pourrait mettre sur cette home, à part faire un truc joli et inutile, je vois pas trop.
/// On verra.
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(Object context, WidgetRef ref) {
    final controller = ref.read(homeControllerProvider);

    return Scaffold(
      bottomNavigationBar: BottomBar(
        pageSelected: PageSelected.none,
        appRouter: controller.appRouter,
      ),
      body: const Center(child: Text('HOME PAGE')),
      backgroundColor: nightGrey,
    );
  }
}
