import 'package:erevho/application/pages/personnal/personnal_controller.dart';
import 'package:erevho/application/widgets/layouts/bottom_bar.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class PersonnalPage extends ConsumerWidget {
  final PersonnalController controller = GetIt.instance();

  PersonnalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    controller.init(context, ref);
    return Scaffold(
      body: const Center(
        child: Text('Personnal'),
      ),
      bottomNavigationBar: BottomBar(pageSelected: PageSelected.personnal),
      backgroundColor: nightGrey,
    );
  }
}
