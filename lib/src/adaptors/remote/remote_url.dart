
import '../../constants/configs/config_environments.dart';

abstract class RemoteUrl {
  static String getAPIUrl() => Environment().config.baseUrl;

  static String getVersionUrl() => "/api/v1/";

  static String getDSNUrl() => Environment().dsnUrl.sentryUrl;
}
