import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provier for bluetooth isntance.
final bluetoothProvider = Provider((_) => FlutterBlue.instance);
