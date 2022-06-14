/// Custom exception class.
class HiveException implements Exception {
  final String cause;
  HiveException({this.cause = ''});
  String toString() => 'HiveException: $cause';
}
