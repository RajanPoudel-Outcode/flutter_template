import 'package:flutter_template/core/services/device_information_retrieval_service/package_information.dart';

import 'device_information.dart';

abstract class DeviceInformationRetrievalService {
  Future<DeviceInformation> fetchDeviceInformation();
  Future<PackageInformation> fetchPackageInformation();
}
