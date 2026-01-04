enum Flavor { dev, stag, prod }

class FlavorValues {
  FlavorValues({
    required this.baseUrl,
    required this.useAnalytics,
    required this.logsResponse,
    required this.clickUpApiKey,
    required this.clickUpListId,
  });
  final String baseUrl;
  final bool useAnalytics;
  final bool logsResponse;
  final String clickUpApiKey;
  final String clickUpListId;
}

class FlavorConfig {
  factory FlavorConfig({required Flavor flavor, required FlavorValues values}) {
    _inst.flavor = flavor;
    _inst.values = values;
    return _inst;
  }

  FlavorConfig._internal();
  late final Flavor flavor;
  late final FlavorValues values;
  static final FlavorConfig _inst = FlavorConfig._internal();

  static bool isProduction() => _inst.flavor == .prod;
  static bool isDevelopment() => _inst.flavor == .dev;
  static bool isUAT() => _inst.flavor == .stag;
  static bool useAnalytics() => _inst.values.useAnalytics;
  static String baseUrl() => _inst.values.baseUrl;

  static bool logsResponse() => _inst.values.logsResponse;
  static String clickUpApiKey() => _inst.values.clickUpApiKey;
  static String clickUpListId() => _inst.values.clickUpListId;

  static String envFile() => switch (_inst.flavor) {
    .dev => '.dev.env.json',
    .stag => '.stag.env.json',
    .prod => '.prod.env.json',
  };

  static String appIconImage() => switch (_inst.flavor) {
    .dev => 'assets/images/dev.png',
    .stag => 'assets/images/stag.png',
    .prod => 'assets/images/prod.png',
  };
}
