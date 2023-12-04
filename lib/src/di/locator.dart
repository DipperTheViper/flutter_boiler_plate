import 'package:get_it/get_it.dart';

import '../adaptors/local/local_handler.dart';
import '../adaptors/remote/api_handler.dart';

GetIt locator = GetIt.instance;

Future<void> setupAllDI() async {
  /// Local Handler
  locator.registerSingleton<LocalHandler>(
    LocalHandler(),
  );

  /// Remote Handler
  locator.registerSingleton<APIHandler>(
    APIHandler(
      locator(),
    ),
  );

  /// Others

}
