import 'package:erevho/application/pages/personnal/personnal_controller.dart';
import 'package:erevho/application/widgets/layouts/bottom_bar.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PersonnalPage extends StatefulWidget {
  const PersonnalPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PersonnalPageState();
}

class PersonnalPageState extends State<PersonnalPage> {
  final PersonnalController controller = GetIt.instance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Personnal'),
      ),
      bottomNavigationBar: BottomBar(pageSelected: PageSelected.personnal),
      backgroundColor: nightGrey,
    );
  }
}
