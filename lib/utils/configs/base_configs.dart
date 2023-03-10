abstract class BaseConfig {
  String get baseUrl;
}

class DevConfig extends BaseConfig {
  @override
  String get baseUrl => "https://urDevUrl.com"; //TODO change
}

class ProductionConfig extends BaseConfig {
  @override
  String get baseUrl => "https://urUrl.com"; //TODO change
}

abstract class DsnUrl {
  String get sentryUrl;
}

class ProductionDsn extends DsnUrl {
  @override
  String get sentryUrl => "https://"; //TODO change
}

class DevelopmentDsn extends DsnUrl {
  @override
  String get sentryUrl => "http://"; //TODO change
}
