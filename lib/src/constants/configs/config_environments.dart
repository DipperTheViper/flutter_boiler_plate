

import 'base_configs.dart';

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
      case Environment.development:
        return DevConfig();
      default:
        return ProductionConfig();
    }
  }

  DsnUrl _getDsnConfig(String environment) {
    switch (environment) {
      case Environment.production:
        return ProductionDsn();
      default:
        return ProductionDsn();
    }
  }
}
