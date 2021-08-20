import 'dart:convert';
import 'dart:io';

import 'helper.dart';

class ResponseParser {
  Future<Map> from(ApiResponse<HttpClientResponse> response, LogHelper log,
      String method) async {
    Map result;
    String reply = await response.value.transform(utf8.decoder).join();
    log.debug(method: method, message: 'reply $reply');

    if (reply.isNotEmpty) {
      result = jsonDecode(reply);
    }

    return result;
  }
}
