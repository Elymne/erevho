import 'package:erevho/application/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  final HomeController controller = GetIt.instance();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('HOME PAGE'),
    );
  }
}
