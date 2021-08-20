// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itunes_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItunesStore _$ItunesStoreFromJson(Map<String, dynamic> json) {
  return ItunesStore(
    wrapperType: json['wrapperType'] as String,
    kind: json['kind'] as String,
    artistId: json['artistId'] as int,
    collectionId: json['collectionId'] as int,
    trackId: json['trackId'] as int,
    artistName: json['artistName'] as String,
    collectionName: json['collectionName'] as String,
    trackName: json['trackName'] as String,
    collectionCensoredName: json['collectionCensoredName'] as String,
    trackCensoredName: json['trackCensoredName'] as String,
    artistViewUrl: json['artistViewUrl'] as String,
    collectionViewUrl: json['collectionViewUrl'] as String,
    trackViewUrl: json['trackViewUrl'] as String,
    previewUrl: json['previewUrl'] as String,
    artworkUrl60: json['artworkUrl60'] as String,
    artworkUrl100: json['artworkUrl100'] as String,
    collectionPrice: (json['collectionPrice'] as num)?.toDouble(),
    trackPrice: (json['trackPrice'] as num)?.toDouble(),
    collectionExplicitness: json['collectionExplicitness'] as String,
    trackExplicitness: json['trackExplicitness'] as String,
    discCount: json['discCount'] as int,
    discNumber: json['discNumber'] as int,
    trackCount: json['trackCount'] as int,
    trackNumber: json['trackNumber'] as int,
    trackTimeMillis: json['trackTimeMillis'] as int,
    country: json['country'] as String,
    currency: json['currency'] as String,
    primaryGenreName: json['primaryGenreName'] as String,
  );
}

Map<String, dynamic> _$ItunesStoreToJson(ItunesStore instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('wrapperType', instance.wrapperType);
  writeNotNull('kind', instance.kind);
  writeNotNull('artistId', instance.artistId);
  writeNotNull('collectionId', instance.collectionId);
  writeNotNull('trackId', instance.trackId);
  writeNotNull('artistName', instance.artistName);
  writeNotNull('collectionName', instance.collectionName);
  writeNotNull('trackName', instance.trackName);
  writeNotNull('collectionCensoredName', instance.collectionCensoredName);
  writeNotNull('trackCensoredName', instance.trackCensoredName);
  writeNotNull('artistViewUrl', instance.artistViewUrl);
  writeNotNull('collectionViewUrl', instance.collectionViewUrl);
  writeNotNull('trackViewUrl', instance.trackViewUrl);
  writeNotNull('previewUrl', instance.previewUrl);
  writeNotNull('artworkUrl60', instance.artworkUrl60);
  writeNotNull('artworkUrl100', instance.artworkUrl100);
  writeNotNull('collectionPrice', instance.collectionPrice);
  writeNotNull('trackPrice', instance.trackPrice);
  writeNotNull('collectionExplicitness', instance.collectionExplicitness);
  writeNotNull('trackExplicitness', instance.trackExplicitness);
  writeNotNull('discCount', instance.discCount);
  writeNotNull('discNumber', instance.discNumber);
  writeNotNull('trackCount', instance.trackCount);
  writeNotNull('trackNumber', instance.trackNumber);
  writeNotNull('trackTimeMillis', instance.trackTimeMillis);
  writeNotNull('country', instance.country);
  writeNotNull('currency', instance.currency);
  writeNotNull('primaryGenreName', instance.primaryGenreName);
  return val;
}

ItunesStoreResponse _$ItunesStoreResponseFromJson(Map<String, dynamic> json) {
  return ItunesStoreResponse(
    resultCount: json['resultCount'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : ItunesStore.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ItunesStoreResponseToJson(ItunesStoreResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('resultCount', instance.resultCount);
  writeNotNull('results', instance.results?.map((e) => e?.toJson())?.toList());
  return val;
}
