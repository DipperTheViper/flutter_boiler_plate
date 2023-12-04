import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'api_response.dart';

abstract class ApiInspector {
  static APIResponse checkResponseStatusCode(
    http.Response response,
    Uri uri,
    Map<String, String> header, {
    String? body,
  }) {
    APIResponse apiResponse = APIResponse();
    if (response.statusCode >= 200 && response.statusCode < 300) {
      apiResponse.setDataSuccess(
        data: utf8.decode(
          response.bodyBytes,
        ),
        massage: "Success",
      );
    } else if (response.statusCode == 401) {
      //  remove all local data
      //  navigate to login screen
      apiResponse.setDataError(
        status: ResponseStatus.unAuthenticated,
        errorMassage: response.statusCode.toString(),
        data: utf8.decode(
          response.bodyBytes,
        ),
      );
    } else if (response.statusCode == 404) {
      apiResponse.setDataError(
        status: ResponseStatus.notFound,
        errorMassage: response.statusCode.toString(),
        data: utf8.decode(
          response.bodyBytes,
        ),
      );
    } else if (response.statusCode >= 500 && response.statusCode < 600) {
      apiResponse.setDataError(
        status: ResponseStatus.serverError,
        errorMassage: response.statusCode.toString(),
        data: utf8.decode(
          response.bodyBytes,
        ),
      );
    } else {
      apiResponse.setDataError(
        status: ResponseStatus.error,
        errorMassage: response.statusCode.toString(),
        data: utf8.decode(
          response.bodyBytes,
        ),
      );
    }
    if (apiResponse.isSuccess()) {
      Logger().i(
        "header: $header \nuri : $uri \nstatusCode : ${response.statusCode} \nReq body: $body \nRes body : ${utf8.decode(
          response.bodyBytes,
        )} ",
      );
    } else {
      Logger().w(
        "header: $header \nuri : $uri \nstatusCode : ${response.statusCode} \nReq body: $body \nRes body : ${utf8.decode(
          response.bodyBytes,
        )} ",
      );
    }
    // if (!apiResponse.isSuccess()) {
    //   String errorMessage = """
    //   Request:
    //     URL:${response.request?.url}
    //     Method:${response.request?.method}
    //     Headers:${response.request?.headers}
    //
    //   Response:
    //     Status code:${response.statusCode}
    //     Headers:${response.headers}
    //     Body:${response.body}
    //       """;
    //   throw Exception(
    //     errorMessage,
    //   );
    // }
    return apiResponse;
  }
// *
}
