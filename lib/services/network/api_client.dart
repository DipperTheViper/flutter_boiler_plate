import 'dart:convert';
import 'package:flutter_boiler_plate/services/local/hive_client.dart';
import 'package:flutter_boiler_plate/services/network/api_get_urls.dart';
import 'package:flutter_boiler_plate/services/network/api_handlers.dart';
import 'package:flutter_boiler_plate/services/network/api_status_codes.dart';
import 'package:flutter_boiler_plate/utils/categories/hive_category.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

abstract class DaratoApiClient {
  static String baseUrl = GetUrl().getUrlAPI();
  static String versionUrl = GetUrl().versionUrl();

  static Future<Map<String, String>> getHeader() async {
    return {
      "Content-Type": "application/json; charset=UTF-8",
    };
  }

  static Future<Map<String, String>> getHeaderWithAccessToken() async {
    final accessToken = await getAccessToken();
    return {
      "Content-Type": "application/json; charset=UTF-8",
      'Authorization': 'Bearer $accessToken'
    };
  }

  static Future<String> getAccessToken() async {
    return await HiveClient.read(
      key: HiveCategory.accessToken,
    );
  }

  static Future<ApiHandler> get(
    String url, {
    bool auth = true,
    Map<String, dynamic> query = const {},
  }) async {
    final finalUrl = '$baseUrl$versionUrl$url';
    Map<String, String> header =
        auth ? await getHeaderWithAccessToken() : await getHeader();
    http.Response response = await http.get(
      Uri.parse(finalUrl).replace(
        queryParameters: query.map(
          (key, value) => MapEntry(
            key,
            value.toString(),
          ),
        ),
      ),
      headers: header,
    );

    ApiHandler responseData = ApiHandler();
    try {
      responseData = StatusCode().checkResponseStatusCode(response);
    } catch (e) {
      responseData.setDataError(errorMassage: 'error');
      Logger().e(responseData.massage);
    }
    if (responseData.status == ResponseStatus.success) {
      Logger().wtf(
        "request: $header \n url : ${Uri.parse(finalUrl).replace(
          queryParameters: query.map(
            (key, value) => MapEntry(
              key,
              value.toString(),
            ),
          ),
        )} \n query : $query \n statusCode : ${response.statusCode} \n body : ${utf8.decode(response.bodyBytes)} ",
      );
    } else {
      Logger().w(
        "request: $header \n url : $finalUrl \n query : $query \n statusCode : ${response.statusCode} \n body : ${utf8.decode(response.bodyBytes)} ",
      );
    }
    return responseData;
  }

  static Future<ApiHandler> post(
    String url, {
    String? body,
    bool auth = true,
  }) async {
    final finalUrl = '$baseUrl$versionUrl$url';
    Map<String, String> header =
        auth ? await getHeaderWithAccessToken() : await getHeader();
    http.Response response = await http.post(
      Uri.parse(finalUrl),
      headers: header,
      // body: jsonEncode(body),
      body: body,
    );

    ApiHandler responseData = ApiHandler();
    try {
      responseData = StatusCode().checkResponseStatusCode(response);
    } catch (e) {
      responseData.setDataError(errorMassage: 'error');
    }
    if (responseData.status == ResponseStatus.success) {
      Logger().i(
        "request: $header \n url : $finalUrl \n req: $body \n statusCode : ${response.statusCode} \n body : ${response.body}",
      );
    } else {
      Logger().w(
        "request: $header \n url : $finalUrl \n req: $body \n statusCode : ${response.statusCode} \n body : ${response.body}",
      );
    }

    return responseData;
  }
}
