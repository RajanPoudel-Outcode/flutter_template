import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'app_version_checker.dart';
import 'app_version_update_model.dart';

class FirestoreAppVersionChecker extends AppVersionChecker {
  FirestoreAppVersionChecker(this.firestore);
  final FirebaseFirestore firestore;

  @override
  Future<AppVersionUpdateModel?> isUpdateRequired(String currentVersion, String platform) async {
    final latestVersion = await getLatestVersion();
    log('latestVersion: $latestVersion');
    if (latestVersion == null) {
      return null;
    }
    final isIos = platform == 'ios';
    final appVersionFromRemote = latestVersion[isIos ? 'ios-version' : 'android-version'];
    final currentExtendedVersion = getExtendedVersionNumber(currentVersion);
    final remoteExtendedVersion = getExtendedVersionNumber(appVersionFromRemote);
    final needsUpdate = remoteExtendedVersion > currentExtendedVersion;
    // final appVersionRemoteArray = appVersionFromRemote.split('.').map(int.parse).toList();
    // final appVersionLocalArray = currentVersion.split('.').map(int.parse).toList();
    // if (appVersionRemoteArray[0] > appVersionLocalArray[0]) {
    //   needsUpdate = true;
    // } else {
    //   if (appVersionRemoteArray[1] > appVersionLocalArray[1]) {
    //     needsUpdate = true;
    //   } else {
    //     if (appVersionRemoteArray[1] != appVersionLocalArray[1]) {
    //       needsUpdate = true;
    //     }
    //     if (appVersionRemoteArray[2] > appVersionLocalArray[2]) {
    //       needsUpdate = true;
    //     }
    //   }
    // }
    return needsUpdate
        ? AppVersionUpdateModel(
            message: latestVersion['message'],
            isMandatoryUpdate: latestVersion[isIos ? 'ios-mandatory' : 'android-mandatory'],
            storeLink: latestVersion[isIos ? 'ios-store-link' : 'android-store-link'],
          )
        : null;
  }

  @override
  Future<Map<String, dynamic>?> getLatestVersion() async {
    final versionDoc = await firestore.collection('appversions').doc('version').get();
    return versionDoc.data();
  }

  /////eg: 1.2.3 => 10020003 , 1.2.11 => 10020011
  /// Converts a version string in the format "X.Y.Z" to an integer representation.
  @override
  int getExtendedVersionNumber(String version) {
    final List<String> versionCells = version.split('.');
    final List<int> versionNumbers = versionCells.map(int.parse).toList();
    return versionNumbers[0] * 100000 + versionNumbers[1] * 1000 + versionNumbers[2];
  }
}
