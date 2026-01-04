import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/core/services/device_information_retrieval_service/package_information.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'device_information.dart';
import 'device_information_retrieval_service.dart';

@LazySingleton(as: DeviceInformationRetrievalService)
class DeviceInformationRetrievalServiceImpl implements DeviceInformationRetrievalService {
  DeviceInformationRetrievalServiceImpl({
    required DeviceInfoPlugin deviceInfoPlugin,
    required PackageInfo packageInfo,
  }) : _deviceInfoPlugin = deviceInfoPlugin,
       _packageInfo = packageInfo;

  final DeviceInfoPlugin _deviceInfoPlugin;
  final PackageInfo _packageInfo;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;

  @override
  Future<DeviceInformation> fetchDeviceInformation() async {
    if (isAndroid) {
      final androidDeviceInfo = await _deviceInfoPlugin.androidInfo;
      return DeviceInformation(
        name: androidDeviceInfo.fingerprint,
        platform: 'android',
        versionName: _packageInfo.version,
        buildNumber: int.tryParse(_packageInfo.buildNumber) ?? 0,
      );
    } else if (isIOS) {
      final iosDeviceInfo = await _deviceInfoPlugin.iosInfo;
      return DeviceInformation(
        name: iosDeviceInfo.identifierForVendor ?? '',
        platform: 'ios',
        versionName: _packageInfo.version,
        buildNumber: int.tryParse(_packageInfo.buildNumber) ?? 0,
      );
    } else {
      final webDeviceInfo = await _deviceInfoPlugin.webBrowserInfo;
      return DeviceInformation(
        name: webDeviceInfo.userAgent ?? '',
        platform: 'web',
        versionName: _packageInfo.version,
        buildNumber: int.tryParse(_packageInfo.buildNumber) ?? 0,
      );
    }
  }

  @override
  Future<PackageInformation> fetchPackageInformation() async {
    return PackageInformation(
      appName: _packageInfo.appName,
      packageName: _packageInfo.packageName,
      versionName: _packageInfo.version,
      buildNumber: _packageInfo.buildNumber,
    );
  }
}
