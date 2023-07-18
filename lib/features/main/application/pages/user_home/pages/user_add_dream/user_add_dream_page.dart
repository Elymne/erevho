import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserAddDreamPage extends ConsumerStatefulWidget {
  const UserAddDreamPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<UserAddDreamPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("CREATE"),
    );
  }
}
