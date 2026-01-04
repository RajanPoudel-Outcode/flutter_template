import 'core/config/flavor_config.dart';
import 'main.dart' as main_file;

void main() {
  FlavorConfig(
    flavor: .prod,
    values: FlavorValues(
      baseUrl: const .fromEnvironment('BASE_URL'),
      useAnalytics: true,
      logsResponse: false,
      clickUpApiKey: const .fromEnvironment('CLICKUP_API_KEY'),
      clickUpListId: const .fromEnvironment('CLICKUP_LIST_ID'),
    ),
  );
  main_file.main();
}
