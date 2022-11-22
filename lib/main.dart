import 'package:erevho/app.dart';
import 'package:erevho/core/data/hive/init_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDb();
  runApp(ProviderScope(child: MyApp()));
}
