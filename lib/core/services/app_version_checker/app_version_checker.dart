import 'app_version_update_model.dart';

abstract class AppVersionChecker {
  // Abstract method to check if app update is required
  Future<AppVersionUpdateModel?> isUpdateRequired(String currentVersion, String platform);

  // Abstract method to get latest app version
  Future<Map<String, dynamic>?> getLatestVersion();

  /////eg: 1.2.3 => 10020003 , 1.2.11 => 10020011
  /// Converts a version string in the format "X.Y.Z" to an integer representation.
  int getExtendedVersionNumber(String version);
}
