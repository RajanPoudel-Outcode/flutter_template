class DeviceInformation {
  DeviceInformation(
      {required this.name,
      required this.platform,
      required this.versionName,
      required this.buildNumber});
  final String name;
  final String platform;
  final String versionName;
  final int buildNumber;
}
