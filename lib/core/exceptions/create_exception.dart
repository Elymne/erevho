/// Custom exception class.
class HiveException implements Exception {
  final String cause;
  HiveException({this.cause = ''});

  @override
  String toString() => 'HiveException: $cause';
}
