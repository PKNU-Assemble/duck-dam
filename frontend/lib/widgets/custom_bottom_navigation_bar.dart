import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/colors/app_colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [];

  // 탭 클릭시 호출될 함수
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/home.svg'),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          label: '검색',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/camera.svg'),
          label: '카메라',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/mypage.svg'),
          label: '마이페이지',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: AppColors.mainOrangeColor,
      unselectedItemColor: AppColors.mainOrangeColor,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}
