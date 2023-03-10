import 'package:flutter_boiler_plate/utils/configs/base_configs.dart';

// click on main.dart on top android studio bar
// in dart entry point add this
//--dart-define=ENVIRONMENT=Development
//or
//--dart-define=ENVIRONMENT=Production
//then the urls will be executed based by your choice from development or production

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String development = 'Development';
  static const String production = 'Production';

  late BaseConfig config;
  late DsnUrl dsnUrl;

  initConfig(String environment) {
    config = _getConfig(environment);
    dsnUrl = _getDsnConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.production:
        return ProductionConfig();
      default:
        return DevConfig();
    }
  }

  DsnUrl _getDsnConfig(String environment) {
    switch (environment) {
      case Environment.production:
        return ProductionDsn();
      default:
        return DevelopmentDsn();
    }
  }
}
