import 'package:erevho/features/bleService/infra/bluetooth/bluetooth_provider.dart';
import 'package:erevho/core/usecase.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getDevicesProvider = Provider((ref) => ref.read(bluetoothProvider));

/// TODO Nul.
class GetDevices extends UsecaseNoParams<void> {
  final FlutterBlue _flutterBlue;

  GetDevices(this._flutterBlue);

  @override
  Future<void> perform() {
    // TODO: implement perform
    throw UnimplementedError();
  }
}
