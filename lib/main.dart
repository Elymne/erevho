import 'package:erevho/app.dart';
import 'package:erevho/core/di/injectable.dart';
import 'package:erevho/core/data/init_db.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Future.wait<void>([
    initDb(),
    Firebase.initializeApp(),
  ]);

  runApp(const MyApp());
}
