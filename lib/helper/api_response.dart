import 'package:flutter/material.dart';

class ApiResponse<T> {
  bool status;
  int code;
  String message;
  T value;

  ApiResponse(
      {@required this.status,
      this.code,
      this.message = '',
      @required this.value});
}
