abstract class BaseConfig {
  String get baseUrl;
}

class DevConfig extends BaseConfig {
  @override
  //TODO: change
  String get baseUrl => "http://dev.example.com";
}

class ProductionConfig extends BaseConfig {
  @override
  //TODO: change
  String get baseUrl => "https://example.com";
}

abstract class DsnUrl {
  String get sentryUrl;
}

class ProductionDsn extends DsnUrl {
  @override
  //TODO: change
  String get sentryUrl => "https://dsnExample.sentry.com/59";
}
