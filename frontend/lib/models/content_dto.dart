class ContentDto {
  final int? contentId;
  final String? contentTitle;
  final String? contentImage;
  final bool? isScraped;
  final String? address;

  ContentDto({
    required this.contentId,
    required this.contentTitle,
    required this.contentImage,
    required this.isScraped,
    required this.address,
  });

  // JSON 데이터를 Dart 객체로 변환하는 factory 생성자
  factory ContentDto.fromJson(Map<String, dynamic> json) {
    return ContentDto(
      contentId: json['contentId'],
      contentTitle: json['contentTitle'],
      contentImage: json['contentImage'],
      isScraped: json['isScraped'],
      address: json['address'],
    );
  }

  // Dart 객체를 JSON 데이터로 변환하는 메서드
  Map<String, dynamic> toJson() {
    return {
      'contentId': contentId,
      'contentTitle': contentTitle,
      'contentImage': contentImage,
      'isScraped': isScraped,
      'address': address,
    };
  }
}

class ContentList {
  final List<ContentDto> contentDtos;

  ContentList({required this.contentDtos});

  factory ContentList.fromJson(Map<String, dynamic> json) {
    var list = json['contentDtos'] as List;
    List<ContentDto> contentDtoList =
        list.map((item) => ContentDto.fromJson(item)).toList();

    return ContentList(contentDtos: contentDtoList);
  }

  Map<String, dynamic> toJson() {
    return {
      'contentDtos': contentDtos.map((item) => item.toJson()).toList(),
    };
  }
}
