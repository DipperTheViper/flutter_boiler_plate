import 'package:flutter_boiler_plate/utils/configs/config_environments.dart';

class GetUrl {
  String getUrlAPI() {
    return Environment().config.baseUrl;
  }

  String getUrlKeyCloak() {
    return "${Environment().config.baseUrl}/auth/realms/master";
  }

  String versionUrl() {
    return "/api/v1/";
  }
}
