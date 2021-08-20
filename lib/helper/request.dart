import 'dart:convert';
import 'dart:io';

import '../config/configs.dart';
import '../helper/helper.dart';

class Request {
  static const fileName = 'lib/app/helpers/request.dart';

  int _timeout;

  LogHelper _log;

  Request() {
    this._log = locator<LogHelper>(param1: fileName, param2: true);
    this._timeout = 30;
  }

  Future<ApiResponse<HttpClientResponse>> getRequest(String url,
      {Map<String, dynamic> queryParameter}) async {
    String method = 'getRequest';
    try {
      HttpClient httpClient = new HttpClient();

      httpClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

      Uri uri = queryParameter != null
          ? Uri.parse(url).replace(queryParameters: queryParameter)
          : Uri.parse(url);

      HttpClientRequest request =
          await httpClient.getUrl(uri).timeout(Duration(seconds: _timeout));

      _log.info(
          method: method, message: 'Uri ${jsonEncode(uri.queryParameters)}');

      HttpClientResponse response = await request.close();

      if (response.statusCode != HttpStatus.ok) {
        print(response.statusCode);

        return ApiResponse<HttpClientResponse>(status: false, value: response);
      }

      httpClient.close();

      return ApiResponse<HttpClientResponse>(status: true, value: response);
    } catch (error) {
      print(error);

      return ApiResponse<HttpClientResponse>(
          status: false, message: error.toString(), value: null);
    }
  }
}
