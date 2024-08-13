import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/colors/app_colors.dart';
import 'package:frontend/widgets/custom_bottom_navigation_bar.dart';
import 'package:frontend/widgets/home_recommend_list.dart';
import 'package:frontend/widgets/main_app_bar.dart';
import 'package:frontend/widgets/search_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MainAppBar(),
      body: SingleChildScrollView(
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
                    child: SvgPicture.asset('assets/icons/main_duckcheol.svg'),
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
                    bottom: 0,
                    left: 0,
                    child: SizedBox(
                      height: 200,
                      child: HomeRecommendList(),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.mainWhiteColor,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SearchBox(),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
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
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 200,
                    child: HomeRecommendList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
