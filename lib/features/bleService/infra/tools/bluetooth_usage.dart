import 'package:erevho/features/bleService/infra/bluetooth/bluetooth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bluetoothUsageProvider = Provider((ref) => BluetoothUsage(ref.read(bluetoothProvider)));

class BluetoothUsage {
  final FlutterBlue _flutterBlue;

  BluetoothUsage(this._flutterBlue);

  /// Get the list of current devices nearby.
  /// [duration] just the duration while scaning and listening to results.
  Future<List<BluetoothDevice>> getScannedDevices(Duration duration) async {
    try {
      _flutterBlue.startScan(timeout: duration);
      final List<BluetoothDevice> results = [];
      _flutterBlue.scanResults.listen((scanResults) {
        for (ScanResult scanResult in scanResults) {
          debugPrint('${scanResult.device.name} found! rssi: ${scanResult.rssi}');
          results.add(scanResult.device);
        }
      });
      _flutterBlue.stopScan();
      return results;
    } catch (_) {
      rethrow;
    }
  }

  /// Connect to a specific device.
  /// Fetch them from [getScannedDevices] function.
  Future connectToDevice(BluetoothDevice bluetoothDevice, {Duration duration = const Duration(seconds: 10)}) async {
    try {
      await bluetoothDevice.connect(timeout: duration);
    } catch (_) {
      rethrow;
    }
  }

  /// Disconnect from current device.
  Future disconnectToDevice(BluetoothDevice bluetoothDevice) async {
    try {
      await bluetoothDevice.disconnect();
    } catch (_) {
      rethrow;
    }
  }

  void test(BluetoothDevice bluetoothDevice) {
    final services = bluetoothDevice.discoverServices();
  }
}
