import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_dreams_list_controller.dart';

class UserDreamsListPage extends ConsumerStatefulWidget {
  const UserDreamsListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<UserDreamsListPage> {
  late final controller = ref.read(userDreamsListControllerProvider);
  late final alt = ref.read(appLocalisationToolsProvider);

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    final userDreams = ref.watch(controller.userDreamsFilteredProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: erevohDark,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: _CustomDreamsListView(userDreams),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomDreamsListView extends StatelessWidget {
  final List<Dream>? userDreams;

  const _CustomDreamsListView(this.userDreams);

  @override
  Widget build(BuildContext context) {
    if (userDreams == null) return const Center(child: Text('Chargement'));
    if (userDreams!.isEmpty) return const Center(child: Text('Pas de rêves enregsitrés'));
    return const Center(child: Text('Liste de rêves'));
  }
}
