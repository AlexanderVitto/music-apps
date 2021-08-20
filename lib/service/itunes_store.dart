import 'dart:convert';

import '../config/configs.dart';
import '../dummy_data/itunes_store.dart' as dummy;
import '../helper/helper.dart';
import '../model/models.dart';

abstract class ItunesStoreAPI {
  Future<ApiResponse<ItunesStoreResponse>> search(
      Map<String, dynamic> queryParameter);

  Future<ApiResponse<ItunesStoreResponse>> lookUp(
      Map<String, dynamic> queryParameter);
}

class Development implements ItunesStoreAPI {
  static const fileName = 'lib/service/itunes_store.dart';

  LogHelper _log;
  Request _request;
  String _host;

  Development() {
    this._log = locator<LogHelper>(param1: fileName, param2: true);
    this._request = locator<Request>();
    this._host = 'https://itunes.apple.com';
  }

  @override
  Future<ApiResponse<ItunesStoreResponse>> lookUp(
      Map<String, dynamic> queryParameter) async {
    final String method = 'lookUp';
    final url = '$_host/lookup';

    _log.debug(method: method, message: 'url $url');

    ItunesStoreResponse _result;

    ApiResponse response =
        await _request.getRequest(url, queryParameter: queryParameter);

    if (!response.status) {
      if (response.value != null) {
        String reply = await response.value.transform(utf8.decoder).join();

        return ApiResponse<ItunesStoreResponse>(
            status: false,
            code: response.value.statusCode,
            message: reply,
            value: null);
      } else {
        return ApiResponse<ItunesStoreResponse>(
            status: false, message: 'Unknown error', value: null);
      }
    }

    Map responseMap = await ResponseParser().from(response, _log, method);
    _result = ItunesStoreResponse.fromJson(responseMap);

    return ApiResponse<ItunesStoreResponse>(status: true, value: _result);
  }

  @override
  Future<ApiResponse<ItunesStoreResponse>> search(
      Map<String, dynamic> queryParameter) async {
    final String method = 'search';
    final url = '$_host/search';

    _log.debug(method: method, message: 'url $url');

    ItunesStoreResponse _result;

    ApiResponse response =
        await _request.getRequest(url, queryParameter: queryParameter);

    if (!response.status) {
      if (response.value != null) {
        String reply = await response.value.transform(utf8.decoder).join();

        return ApiResponse<ItunesStoreResponse>(
            status: false,
            code: response.value.statusCode,
            message: reply,
            value: null);
      } else {
        return ApiResponse<ItunesStoreResponse>(
            status: false, message: 'Unknown error', value: null);
      }
    }

    Map responseMap = await ResponseParser().from(response, _log, method);
    _result = ItunesStoreResponse.fromJson(responseMap);

    return ApiResponse<ItunesStoreResponse>(status: true, value: _result);
  }
}

class Testing implements ItunesStoreAPI {
  static const fileName = 'lib/service/itunes_store.dart';

  LogHelper _log;
  Request _request;

  Testing() {
    this._log = locator<LogHelper>(param1: fileName, param2: true);
    this._request = locator<Request>();
  }

  @override
  Future<ApiResponse<ItunesStoreResponse>> lookUp(
      Map<String, dynamic> queryParameter) async {
    final String method = 'lookUp';
    ItunesStoreResponse result;

    result = ItunesStoreResponse.fromJson(dummy.loolUp);

    _log.info(method: method, message: 'result status: ${result.resultCount}');

    return ApiResponse<ItunesStoreResponse>(status: true, value: result);
  }

  @override
  Future<ApiResponse<ItunesStoreResponse>> search(
      Map<String, dynamic> queryParameter) async {
    final String method = 'search';
    ItunesStoreResponse result;

    result = ItunesStoreResponse.fromJson(dummy.search);

    _log.info(method: method, message: 'result status: ${result.resultCount}');

    return ApiResponse<ItunesStoreResponse>(status: true, value: result);
  }
}
