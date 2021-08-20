import 'package:json_annotation/json_annotation.dart';

part 'itunes_store.g.dart';

@JsonSerializable(explicitToJson: true)
class ItunesStore {
  @JsonKey(name: 'wrapperType', defaultValue: null, includeIfNull: false)
  final String wrapperType;

  @JsonKey(name: 'kind', defaultValue: null, includeIfNull: false)
  final String kind;

  @JsonKey(name: 'artistId', defaultValue: null, includeIfNull: false)
  final int artistId;

  @JsonKey(name: 'collectionId', defaultValue: null, includeIfNull: false)
  final int collectionId;

  @JsonKey(name: 'trackId', defaultValue: null, includeIfNull: false)
  final int trackId;

  @JsonKey(name: 'artistName', defaultValue: null, includeIfNull: false)
  final String artistName;

  @JsonKey(name: 'collectionName', defaultValue: null, includeIfNull: false)
  final String collectionName;

  @JsonKey(name: 'trackName', defaultValue: null, includeIfNull: false)
  final String trackName;

  @JsonKey(
      name: 'collectionCensoredName', defaultValue: null, includeIfNull: false)
  final String collectionCensoredName;

  @JsonKey(name: 'trackCensoredName', defaultValue: null, includeIfNull: false)
  final String trackCensoredName;

  @JsonKey(name: 'artistViewUrl', defaultValue: null, includeIfNull: false)
  final String artistViewUrl;

  @JsonKey(name: 'collectionViewUrl', defaultValue: null, includeIfNull: false)
  final String collectionViewUrl;

  @JsonKey(name: 'trackViewUrl', defaultValue: null, includeIfNull: false)
  final String trackViewUrl;

  @JsonKey(name: 'previewUrl', defaultValue: null, includeIfNull: false)
  final String previewUrl;

  @JsonKey(name: 'artworkUrl60', defaultValue: null, includeIfNull: false)
  final String artworkUrl60;

  @JsonKey(name: 'artworkUrl100', defaultValue: null, includeIfNull: false)
  final String artworkUrl100;

  @JsonKey(name: 'collectionPrice', defaultValue: null, includeIfNull: false)
  final double collectionPrice;

  @JsonKey(name: 'trackPrice', defaultValue: null, includeIfNull: false)
  final double trackPrice;

  @JsonKey(
      name: 'collectionExplicitness', defaultValue: null, includeIfNull: false)
  final String collectionExplicitness;

  @JsonKey(name: 'trackExplicitness', defaultValue: null, includeIfNull: false)
  final String trackExplicitness;

  @JsonKey(name: 'discCount', defaultValue: null, includeIfNull: false)
  final int discCount;

  @JsonKey(name: 'discNumber', defaultValue: null, includeIfNull: false)
  final int discNumber;

  @JsonKey(name: 'trackCount', defaultValue: null, includeIfNull: false)
  final int trackCount;

  @JsonKey(name: 'trackNumber', defaultValue: null, includeIfNull: false)
  final int trackNumber;

  @JsonKey(name: 'trackTimeMillis', defaultValue: null, includeIfNull: false)
  final int trackTimeMillis;

  @JsonKey(name: 'country', defaultValue: null, includeIfNull: false)
  final String country;

  @JsonKey(name: 'currency', defaultValue: null, includeIfNull: false)
  final String currency;

  @JsonKey(name: 'primaryGenreName', defaultValue: null, includeIfNull: false)
  final String primaryGenreName;

  @JsonKey(name: 'isPlay', defaultValue: null, includeIfNull: false)
  bool isPlay;

  @JsonKey(name: 'isPause', defaultValue: null, includeIfNull: false)
  bool isPause;

  ItunesStore(
      {this.wrapperType,
      this.kind,
      this.artistId,
      this.collectionId,
      this.trackId,
      this.artistName,
      this.collectionName,
      this.trackName,
      this.collectionCensoredName,
      this.trackCensoredName,
      this.artistViewUrl,
      this.collectionViewUrl,
      this.trackViewUrl,
      this.previewUrl,
      this.artworkUrl60,
      this.artworkUrl100,
      this.collectionPrice,
      this.trackPrice,
      this.collectionExplicitness,
      this.trackExplicitness,
      this.discCount,
      this.discNumber,
      this.trackCount,
      this.trackNumber,
      this.trackTimeMillis,
      this.country,
      this.currency,
      this.primaryGenreName,
      this.isPlay = false,
      this.isPause = false});

  factory ItunesStore.fromJson(Map<String, dynamic> json) =>
      _$ItunesStoreFromJson(json);

  Map<String, dynamic> toJson() => _$ItunesStoreToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ItunesStoreResponse {
  @JsonKey(name: 'resultCount', defaultValue: null, includeIfNull: false)
  final int resultCount;

  @JsonKey(name: 'results', defaultValue: null, includeIfNull: false)
  final List<ItunesStore> results;

  ItunesStoreResponse({this.resultCount, this.results});

  factory ItunesStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$ItunesStoreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItunesStoreResponseToJson(this);
}
