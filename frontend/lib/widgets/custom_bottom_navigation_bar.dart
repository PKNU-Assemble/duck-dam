import 'package:flutter/material.dart';
import 'package:frontend/assets/colors/app_colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  // 탭 클릭시 호출될 함수
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '검색',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '카메라',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '지도',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '마이페이지',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: AppColors.selectedColor,
      unselectedItemColor: AppColors.noSelectedColor,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}
