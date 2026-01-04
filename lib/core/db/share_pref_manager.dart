import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharePrefManager {
  @preResolve // Ensures the future is resolved before usage
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
