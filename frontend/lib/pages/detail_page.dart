import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // SvgPicture 사용을 위해 추가
import 'package:frontend/widgets/custom_bottom_navigation_bar.dart';
import 'package:frontend/widgets/main_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/icons/main_background.svg',
              fit: BoxFit.cover,
            ),
          ),
          const Column(
            children: [
              SizedBox(
                height: 500, // 이미지의 높이
                width: double.infinity,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
