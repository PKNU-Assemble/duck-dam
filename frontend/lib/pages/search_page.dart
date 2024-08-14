import 'package:flutter/material.dart';
import 'package:frontend/colors/app_colors.dart';
import 'package:frontend/models/search_content_dto.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/widgets/custom_bottom_navigation_bar.dart';
import 'package:frontend/widgets/search_box.dart';
import 'package:frontend/widgets/recent_search_word.dart';
import 'package:frontend/widgets/select_movie_drama_tab.dart';
import 'package:frontend/widgets/selectable_circle.dart';
import 'package:frontend/pages/detail_page.dart'; // DetailPage 임포트

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
    required this.isDrama,
    this.searchContentResponse,
    this.hint,
  });

  final bool isDrama;
  final String? hint;
  final SearchContentResponse? searchContentResponse;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late bool isDrama;
  String? hint;
  late List<dynamic> keywords = [];
  late List<SelectableCircle> selectableCircles = [];

  @override
  void initState() {
    super.initState();
    isDrama = widget.isDrama;
    hint = widget.hint;
    _fetchRecentSearches();
    _generateSelectableCircles();
  }

  Future<void> _fetchRecentSearches() async {
    final recentKeywords = await APIService.getRecentSearch(
        hint ?? '', isDrama ? 'Drama' : 'Movie');
    if (recentKeywords != null) {
      setState(() {
        keywords = recentKeywords;
      });
    }
  }

  void _generateSelectableCircles() {
    if (widget.searchContentResponse != null) {
      selectableCircles = widget.searchContentResponse!.searchContentDtos
          .map((dto) => SelectableCircle(
                contentTitle: dto.contentTitle,
                contentImage: dto.contentImage,
                onTap: () {
                  // DetailPage로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(contentId: dto.contentId),
                    ),
                  );
                },
              ))
          .toList();
    }
  }

  void _onTabSelected(int index) {
    setState(
      () {
        isDrama = index == 1; // '드라마' 탭이 선택되면 true, '영화' 탭이 선택되면 false
      },
    );

    // 선택된 탭에 따라 필요한 작업을 수행
    _fetchRecentSearches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhiteColor,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 115, // 원하는 높이 설정 (SearchBox 높이의 절반)
                color: AppColors.mainSkyColor,
              ),
              Expanded(
                child: Container(
                  color: AppColors.mainWhiteColor,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 70.0,
              ),
              child: Column(
                children: [
                  SearchBox(
                    isComeFromHome: false,
                    isDrama: isDrama,
                    hint: hint, // hint를 SearchBox에 전달
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Row(
                    children: [
                      Text(
                        "최근 검색어",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: keywords
                          .map((keyword) => RecentSearchWord(text: keyword))
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SelectMovieDramaTab(onTabSelected: _onTabSelected),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 가로로 3개씩 배치
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: selectableCircles.length,
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // 전체 페이지 스크롤 사용
                    itemBuilder: (context, index) {
                      return selectableCircles[index];
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
