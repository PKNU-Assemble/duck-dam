import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/colors/app_colors.dart';
import 'package:frontend/models/content_dto.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/widgets/custom_bottom_navigation_bar.dart';
import 'package:frontend/widgets/home_recommend_list.dart';
import 'package:frontend/widgets/main_app_bar.dart';
import 'package:frontend/widgets/search_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ContentDto> contentDto = [];
  List<ContentDto> simpleContentDto = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
    print(simpleContentDto);
  }

  Future<void> _fetchData() async {
    try {
      final fetchedContentDto = await APIService.getContentDto();
      final fetchedSimpleContentDto = await APIService.getSimpleContentDto();

      setState(() {
        contentDto = fetchedContentDto;
        simpleContentDto = fetchedSimpleContentDto;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false; // 오류가 발생해도 로딩 상태 해제
      });
      print('데이터를 불러오는 중 오류가 발생했습니다: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MainAppBar(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) // 로딩 중일 때 표시
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 600,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.mainSkyColor,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 80,
                          right: 30,
                          child: SvgPicture.asset(
                              'assets/icons/main_duckcheol.svg'),
                        ),
                        Positioned(
                          top: 60,
                          left: 20,
                          child: Image.asset('assets/icons/logo.png'),
                          width: 100,
                        ),
                        Positioned(
                          top: 150,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '안녕하세요, 오리님',
                                style: TextStyle(
                                  color: AppColors.boldFontsColor,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                '오늘의 추천 촬영지는\n바로 여기임',
                                style: TextStyle(
                                  color: AppColors.thinFontsColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          child: SizedBox(
                            height: 280,
                            child: HomeRecommendList(
                              contentDtos: contentDto,
                              type: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.mainWhiteColor,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const SearchBox(
                          isComeFromHome: true,
                          isDrama: false,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "오리님의 관심있는 콘텐츠",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 250,
                          child: HomeRecommendList(
                            contentDtos: simpleContentDto,
                            type: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
