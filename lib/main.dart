import 'package:erevho/app.dart';
import 'package:erevho/core/data/init_db.dart';
import 'package:erevho/di/injectable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await initDb();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
