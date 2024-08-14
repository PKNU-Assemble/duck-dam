import 'dart:convert';
import 'package:frontend/models/content_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:http_parser/http_parser.dart';
import 'package:frontend/models/content_dto.dart';

const String domainUrl =
    'https://port-0-hackathon-be-lyqylohp8957ca6e.sel5.cloudtype.app';

class APIService {
  static Future<List<ContentDto>> getContentDto() async {
    const url = '$domainUrl/api/content/interest?userId=1&pagesize=5';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print("불러오기 성공");
        final responseData = json.decode(utf8.decode(response.bodyBytes));
        final data = responseData['contentDtos'];

        if (data != null && data is List) {
          return data
              .map<ContentDto>((item) => ContentDto.fromJson(item))
              .toList();
        }
      }
      return [];
    } catch (error) {
      return [];
    }
  }

  static Future<List<ContentDto>> getSimpleContentDto() async {
    const url = '$domainUrl/api/content/scrap?userId=1';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print("불러오기 성공");
        final responseData = json.decode(utf8.decode(response.bodyBytes));
        final data = responseData['simpleContentDtos'];

        if (data != null && data is List) {
          return data
              .map<ContentDto>((item) => ContentDto.fromJson(item))
              .toList();
        }
      }
      return [];
    } catch (error) {
      return [];
    }
  }

  static Future<ContentDetail?> getContentDetail(int contentId) async {
    final url = '$domainUrl/api/detail/content?userId=1&contentId=$contentId';

    print(url);

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print("불러오기 성공");
        final responseData = json.decode(utf8.decode(response.bodyBytes));
        print(responseData);

        if (responseData != null && responseData is Map<String, dynamic>) {
          return ContentDetail.fromJson(responseData);
        }
      }
      return null;
    } catch (error) {
      print("에러 발생: $error");
      return null;
    }
  }
}
