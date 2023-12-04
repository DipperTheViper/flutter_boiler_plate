import 'dart:io';

import 'package:http/http.dart' as http;

import '../local/local_handler.dart';

import 'api_inspector.dart';
import 'api_response.dart';
export 'api_response.dart';
export '../../constants/categories/api_category.dart';
import 'remote_url.dart';

class APIHandler {
  APIHandler(
    this._localHandler,
  );

  final LocalHandler _localHandler;
  final String _baseUrl = RemoteUrl.getAPIUrl();
  final String _versionUrl = RemoteUrl.getVersionUrl();

  // Future<String> _getAccessTokenFromRefreshToken() async {
  //   final refreshToken = await _localHandler.read(
  //     key: LocalCategory.refreshToken,
  //   );
  //   final accessToken = await _localHandler.read(
  //     key: LocalCategory.accessToken,
  //   );
  //
  //   Map<String, String> header = {
  //     "Content-Type": "application/json; charset=UTF-8",
  //     'Authorization': 'Bearer $accessToken',
  //   };
  //   Uri uri = _getFinalUri(
  //     endPoint: APICategory.refresh,
  //     query: {},
  //     isNotification: false,
  //   );
  //   late ApiResponse apiResponse;
  //   try {
  //     http.Response response = await http.post(
  //       uri,
  //       headers: header,
  //       body: json.encode(
  //         {
  //           "refresh_token": refreshToken,
  //         },
  //       ),
  //     );
  //
  //     apiResponse = ApiInspector.checkResponseStatusCode(
  //       response,
  //       uri,
  //       header,
  //     );
  //   } catch (error) {
  //     apiResponse = _setError(error);
  //   }
  //   if (apiResponse.isSuccess()) {
  //     RefreshTokenDTO dto = refreshTokenDTOFromMap(
  //       apiResponse.getData(),
  //     );
  //     await _localHandler.write(
  //       key: LocalCategory.accessToken,
  //       value: dto.accessToken,
  //     );
  //     await _localHandler.write(
  //       key: LocalCategory.expireTime,
  //       value: dto.expiresIn,
  //     );
  //     return dto.accessToken;
  //   } else {
  //     return accessToken;
  //   }
  // }

  Future<String?> getAccessToken() async {
    // final double expireTime = await _localHandler.read(
    //       key: LocalCategory.expireTime,
    //     ) ??
    //     0;
    // if (DateTimeUtils.isTimeToRefresh(expireTime)) {
    //   return _getAccessTokenFromRefreshToken();
    // } else {
    return await _localHandler.read(
      key: LocalCategory.accessToken,
    );
    // }
  }

  Future<Map<String, String>> _getHeader({
    bool withAccessToken = false,
  }) async {
    if (withAccessToken) {
      final String? token = await getAccessToken();
      return {
        "Content-Type": "application/json; charset=UTF-8",
        'Authorization': 'Bearer $token'
      };
    } else {
      return {
        "Content-Type": "application/json; charset=UTF-8",
      };
    }
  }

  Uri _getFinalUri({
    required String endPoint,
    required Map<String, dynamic> query,
  }) {
    final finalUrl = '$_baseUrl$_versionUrl$endPoint';
    return Uri.parse(finalUrl).replace(
      queryParameters: query.map(
        (
          key,
          value,
        ) {
          if (value.runtimeType == List<String>) {
            return MapEntry(
              key,
              value,
            );
          }
          return MapEntry(
            key,
            value.toString(),
          );
        },
      ),
    );
  }

  Future<APIResponse> get(
    String endPoint, {
    bool auth = true,
    Map<String, dynamic>? query,
  }) async {
    Map<String, String> header = await _getHeader(
      withAccessToken: auth,
    );
    Uri uri = _getFinalUri(
      endPoint: endPoint,
      query: query ?? {},
    );

    try {
      http.Response response = await http.get(
        uri,
        headers: header,
      );
      return ApiInspector.checkResponseStatusCode(
        response,
        uri,
        header,
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<APIResponse> post(
    String url, {
    bool auth = true,
    String? body,
    Map<String, dynamic>? query = const {},
  }) async {
    Map<String, String> header = await _getHeader(
      withAccessToken: auth,
    );
    Uri uri = _getFinalUri(
      endPoint: url,
      query: query ?? {},
    );

    try {
      http.Response response = await http.post(
        uri,
        headers: header,
        body: body,
      );

      return ApiInspector.checkResponseStatusCode(
        response,
        uri,
        header,
        body: body,
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<APIResponse> delete(
    String url, {
    bool auth = true,
    String? body,
    Map<String, dynamic>? query = const {},
  }) async {
    Map<String, String> header = await _getHeader(
      withAccessToken: auth,
    );
    Uri uri = _getFinalUri(
      endPoint: url,
      query: query ?? {},
    );

    try {
      http.Response response = await http.delete(
        uri,
        headers: header,
        body: body,
      );

      return ApiInspector.checkResponseStatusCode(
        response,
        uri,
        header,
        body: body,
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<APIResponse> patch(
    String url, {
    bool auth = true,
    String? body,
    Map<String, dynamic>? query = const {},
  }) async {
    Map<String, String> header = await _getHeader(
      withAccessToken: auth,
    );
    Uri uri = _getFinalUri(
      endPoint: url,
      query: query ?? {},
    );

    try {
      http.Response response = await http.patch(
        uri,
        headers: header,
        body: body,
      );
      return ApiInspector.checkResponseStatusCode(
        response,
        uri,
        header,
        body: body,
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<APIResponse> postWithFile(
    String url, {
    bool auth = true,
    required Map<String, dynamic> body,
    Map<String, dynamic>? query = const {},
    required File image,
    required String imageKey,
  }) async {
    Map<String, String> header = await _getHeader(
      withAccessToken: auth,
    );
    Uri uri = _getFinalUri(
      endPoint: url,
      query: query ?? {},
    );
    try {
      http.MultipartRequest request = http.MultipartRequest(
        'POST',
        uri,
      );
      request.headers.addAll(header);
      for (var key in body.keys) {
        request.fields[key] = body[key].toString();
      }
      request.files.add(
        await http.MultipartFile.fromPath(
          (imageKey),
          image.path,
        ),
      );
      var response = await request.send();
      return ApiInspector.checkResponseStatusCode(
        await http.Response.fromStream(response),
        uri,
        header,
        body: body.toString(),
      );
    } catch (error) {
      rethrow;
    }
  }
  Future<APIResponse> patchWithFile(
    String url, {
    bool auth = true,
    required Map<String, dynamic> body,
    Map<String, dynamic>? query = const {},
    required File image,
    required String imageKey,
  }) async {
    Map<String, String> header = await _getHeader(
      withAccessToken: auth,
    );
    Uri uri = _getFinalUri(
      endPoint: url,
      query: query ?? {},
    );
    try {
      http.MultipartRequest request = http.MultipartRequest(
        'PATCH',
        uri,
      );
      request.headers.addAll(header);
      for (var key in body.keys) {
        request.fields[key] = body[key].toString();
      }
      request.files.add(
        await http.MultipartFile.fromPath(
          (imageKey),
          image.path,
        ),
      );
      var response = await request.send();
      return ApiInspector.checkResponseStatusCode(
        await http.Response.fromStream(response),
        uri,
        header,
        body: body.toString(),
      );
    } catch (error) {
      rethrow;
    }
  }
}
