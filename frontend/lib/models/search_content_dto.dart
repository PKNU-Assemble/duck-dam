class SearchContentResponse {
  final bool hasNextPage;
  final List<SearchContentDto> searchContentDtos;

  SearchContentResponse({
    required this.hasNextPage,
    required this.searchContentDtos,
  });

  factory SearchContentResponse.fromJson(Map<String, dynamic> json) {
    return SearchContentResponse(
      hasNextPage: json['hasNextPage'],
      searchContentDtos: List<SearchContentDto>.from(
        json['searchContentDtos']
            .map((item) => SearchContentDto.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hasNextPage': hasNextPage,
      'searchContentDtos':
          searchContentDtos.map((item) => item.toJson()).toList(),
    };
  }
}

class SearchContentDto {
  final int contentId;
  final String contentTitle;
  final String contentImage;

  SearchContentDto({
    required this.contentId,
    required this.contentTitle,
    required this.contentImage,
  });

  factory SearchContentDto.fromJson(Map<String, dynamic> json) {
    return SearchContentDto(
      contentId: json['contentId'],
      contentTitle: json['contentTitle'],
      contentImage: json['contentImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contentId': contentId,
      'contentTitle': contentTitle,
      'contentImage': contentImage,
    };
  }
}
