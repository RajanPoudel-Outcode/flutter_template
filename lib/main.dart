import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'core/injection/injection.dart';
import 'main_app.dart';

void main() async {
  // await runZonedGuarded<Future<void>>(() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.dev);

  runApp(const MainApp());
  // }, (error, stackTrace) {
  //   log('ERROR : $error ::: SR :$stackTrace');
  // }, zoneSpecification: ZoneSpecification(print: (self, parent, zone, line) {
  //   parent.print(zone, 'Intercepted: $line');
  //   // ConsoleLogStream().updateData(line);
  // }));
}
