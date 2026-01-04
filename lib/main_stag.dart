import 'core/config/flavor_config.dart';
import 'main.dart' as main_file;

void main() {
  FlavorConfig(
    flavor: .stag,
    values: FlavorValues(
      baseUrl: const .fromEnvironment('BASE_URL'),
      useAnalytics: false,
      logsResponse: true,
      clickUpApiKey: const .fromEnvironment('CLICKUP_API_KEY'),
      clickUpListId: const .fromEnvironment('CLICKUP_LIST_ID'),
    ),
  );
  main_file.main();
}
