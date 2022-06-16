import 'package:erevho/app.dart';
import 'package:erevho/core/data/init_db.dart';
import 'package:erevho/di/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await initDb();
  runApp(ProviderScope(child: MyApp()));
}
