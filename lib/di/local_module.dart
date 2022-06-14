import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// List of injectable services, classes.
@module
abstract class LocalModule {
  /// Get sharedPreferences service.
  @preResolve
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();

  /// Generate uuid to string.
  @Named('uuid')
  @Singleton()
  String get uuid {
    const uuid = Uuid();
    return uuid.v4();
  }
}
