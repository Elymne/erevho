import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(Object context, WidgetRef ref) {
    // final controller = ref.read(homeControllerProvider);

    return Scaffold(
      body: const Center(child: Text('HOME PAGE')),
      backgroundColor: erevohBlue,
    );
  }
}
