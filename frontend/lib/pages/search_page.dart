import 'package:flutter/material.dart';
import 'package:frontend/colors/app_colors.dart';
import 'package:frontend/widgets/custom_bottom_navigation_bar.dart';
import 'package:frontend/widgets/search_box.dart';
import 'package:frontend/widgets/recent_search_word.dart';
import 'package:frontend/widgets/select_movie_drama_tab.dart';
import 'package:frontend/widgets/selectable_circle.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
                  const SearchBox(),
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
                  const Row(
                    children: [
                      RecentSearchWord(),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const SelectMovieDramaTab(),
                  const SelectableCircle(),
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
