class ContentDetail {
  final int contentId;
  final String contentTitle;
  final String contentImage;
  final String contentType;
  final String year;
  final bool isScraped;
  final List<String> addressTag;
  final List<PlaceDto> placeDtos;

  ContentDetail({
    required this.contentId,
    required this.contentTitle,
    required this.contentImage,
    required this.contentType,
    required this.year,
    required this.isScraped,
    required this.addressTag,
    required this.placeDtos,
  });

  factory ContentDetail.fromJson(Map<String, dynamic> json) {
    return ContentDetail(
      contentId: json['contentId'],
      contentTitle: json['contentTitle'],
      contentImage: json['contentImage'],
      contentType: json['contentType'],
      year: json['year'],
      isScraped: json['isScraped'],
      addressTag: List<String>.from(json['addressTag']),
      placeDtos: (json['placeDtos'] as List)
          .map((place) => PlaceDto.fromJson(place))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contentId': contentId,
      'contentTitle': contentTitle,
      'contentImage': contentImage,
      'contentType': contentType,
      'year': year,
      'isScraped': isScraped,
      'addressTag': addressTag,
      'placeDtos': placeDtos.map((place) => place.toJson()).toList(),
    };
  }
}

class PlaceDto {
  final int placeId;
  final String placeName;
  final String placeOverview;
  final String placeImage;
  final String placeAddress;
  final String openTime;

  PlaceDto({
    required this.placeId,
    required this.placeName,
    required this.placeOverview,
    required this.placeImage,
    required this.placeAddress,
    required this.openTime,
  });

  factory PlaceDto.fromJson(Map<String, dynamic> json) {
    return PlaceDto(
      placeId: json['placeId'],
      placeName: json['placeName'],
      placeOverview: json['placeOverview'],
      placeImage: json['placeImage'],
      placeAddress: json['placeAddress'],
      openTime: json['openTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'placeId': placeId,
      'placeName': placeName,
      'placeOverview': placeOverview,
      'placeImage': placeImage,
      'placeAddress': placeAddress,
      'openTime': openTime,
    };
  }
}
