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
    return const Scaffold(
      backgroundColor: AppColors.mainWhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 70.0,
          ),
          child: Column(
            children: [
              SearchBox(),
              RecentSearchWord(),
              SelectMovieDramaTab(),
              SelectableCircle(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
