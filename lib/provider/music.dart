import 'dart:convert';

import 'package:flutter/material.dart';

import '../helper/helper.dart';
import '../config/configs.dart';
import '../model/models.dart' as models;

import '../service/itunes_store.dart' as itunesStore;

class Music with ChangeNotifier {
  static const fileName = 'lib/provider/music.dart';

  LogHelper _log;
  itunesStore.ItunesStoreAPI _itunesStoreAPI;

  List<models.ItunesStore> _searchData;
  List<models.ItunesStore> get searchData => _searchData;
  List<models.ItunesStore> _lookUpData;
  List<models.ItunesStore> get lookUpData => _lookUpData;

  String _responseMessage;
  String get responseMessage => _responseMessage;

  Music() {
    this._log = locator<LogHelper>(param1: fileName, param2: true);
    this._itunesStoreAPI = locator<itunesStore.ItunesStoreAPI>();

    this._searchData = [];
    this._lookUpData = [];

    this._responseMessage = '';
  }

  close() {
    this._searchData = [];
    this._lookUpData = [];

    this._responseMessage = '';
  }

  Future search(Map<String, dynamic> queryParameter) async {
    final String method = 'search';
    _log.info(method: method, message: jsonEncode(queryParameter));

    try {
      ApiResponse<models.ItunesStoreResponse> response =
          await _itunesStoreAPI.search(queryParameter);

      if (!response.status) {
        switch (response.code) {
          case 401:
            _responseMessage = '';
            break;
          case 408:
            _responseMessage = 'Request timeout';
            break;
          case 500:
            _responseMessage = 'Internal server error';
            break;
          default:
            _responseMessage = response.message;
        }
      } else {
        // Store all search result to local property
        _searchData.addAll(response.value.results);

        // Delete duplicates data
        final jsonList = _searchData.map((item) => jsonEncode(item)).toList();
        final uniqueJsonList = jsonList.toSet().toList();
        _searchData = uniqueJsonList
            .map((item) => models.ItunesStore.fromJson(jsonDecode(item)))
            .toList();

        notifyListeners();
      }
    } catch (error) {
      _log.error(method: method, message: error.toString());
    }
  }
}
