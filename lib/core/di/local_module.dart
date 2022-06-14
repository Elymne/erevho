import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// List of injectable services, classes.
@module
abstract class LocalModule {
  /// Get sharedPreferences service.
  @preResolve
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();

  /// Get UUID generator id.
  @Singleton()
  String get idGenerated {
    const uuid = Uuid();
    return uuid.v4();
  }
}
