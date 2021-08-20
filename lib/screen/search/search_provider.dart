import 'package:flutter/material.dart';

import '../../config/configs.dart';
import '../../helper/helper.dart';
import '../../model/models.dart' as models;
import '../../provider/providers.dart' as providers;

class SearchProvider with ChangeNotifier {
  static const fileName = 'lib/screen/search/search_provider.dart';

  LogHelper _log;
  providers.Music _music;

  TextEditingController _searchController;
  TextEditingController get searchController => _searchController;

  List<models.ItunesStore> _searchData;
  List<models.ItunesStore> get searchData => _searchData;

  models.ItunesStore _selectedMusic;
  models.ItunesStore get selectedMusic => _selectedMusic;

  bool _isSelected;
  bool get isSelected => _isSelected;

  int _searchValueLength;
  String _artistName;

  SearchProvider(providers.Music music) {
    this._log = locator<LogHelper>(param1: fileName, param2: true);
    this._music = music;
  }

  update(providers.Music music) {
    this._music = music;
    this._searchData = music.searchData;
    if (_artistName != null) ;
    this._searchData = _searchData
        .where((element) => element.artistName
            .contains(new RegExp(_artistName, caseSensitive: false)))
        .toList();
    this._selectedMusic = music.searchData
        .firstWhere((element) => element.isPlay, orElse: () => null);

    notifyListeners();
  }

  initialize() {
    _searchController = TextEditingController();

    _searchData = _music.searchData;
    _artistName = null;
    _searchValueLength = 0;
    _isSelected = false;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  onSearch(String value) {
    _artistName = value;
    if (value.length > _searchValueLength) {
      Map<String, dynamic> queryParameter = {
        "term": value,
        "entity": "song",
        "limit": "10",
        "sort": "popular"
      };

      _music.search(queryParameter);
    } else {
      _searchData = _music.searchData;
      _searchData = _searchData
          .where((element) => element.artistName
              .contains(new RegExp(value, caseSensitive: false)))
          .toList();

      notifyListeners();
    }

    _searchValueLength = value.length;
  }

  onSelected(models.ItunesStore data) {
    _selectedMusic = data;
    _isSelected = true;

    _searchData.forEach((element) {
      if (element.trackId == data.trackId) {
        element.isPlay = true;
        element.isPause = false;
      } else {
        element.isPlay = false;
        element.isPause = false;
      }
    });

    notifyListeners();
  }

  onPause(models.ItunesStore data) {
    _selectedMusic = data;
    _searchData.forEach((element) {
      if (element.trackId == data.trackId) {
        element.isPlay = false;
        element.isPause = true;
      } else {
        element.isPlay = false;
        element.isPause = false;
      }
    });

    notifyListeners();
  }

  onPlay(models.ItunesStore data) {
    _selectedMusic = data;
    _searchData.forEach((element) {
      if (element.trackId == data.trackId) {
        element.isPlay = true;
        element.isPause = false;
      } else {
        element.isPlay = false;
        element.isPause = false;
      }
    });

    notifyListeners();
  }
}
