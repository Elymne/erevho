abstract class BluetoothRepository {
  Future<String> receiveMessage();
  Future<String> sendMessage();
}
