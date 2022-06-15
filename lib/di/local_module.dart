import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// List of injectable services, classes.
@module
abstract class LocalModule {
  /// Get sharedPreferences service.
  @preResolve
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}
