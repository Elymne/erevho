import 'package:erevho/application/pages/home/home_controller.dart';
import 'package:erevho/application/widgets/layouts/bottom_bar.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

/// TODO rename cette page, y aura pas de home sur l'app. Ou peut-être que si, si rien n'est sélectionné sur la bottombar en partant du principe que c'est possible.
/// Dans quel cas, réfléchir à ce que l'on pourrait mettre sur cette home, à part faire un truc joli et inutile, je vois pas trop.
/// On verra.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  final HomeController controller = GetIt.instance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(pageSelected: PageSelected.none),
      body: const Center(
        child: Text('HOME PAGE'),
      ),
      backgroundColor: nightGrey,
    );
  }
}
