import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/colors/app_colors.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: AppColors.mainWhiteColor,
          height: 25,
        ),
        onPressed: () {
          Navigator.of(context).pop(); // 뒤로 가기 버튼 동작
        },
        padding: const EdgeInsets.only(left: 16.0), // 아이콘과 화면 가장자리 사이의 여백 조정
      ),
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: SvgPicture.asset(
            'assets/icons/bookmark.svg',
            color: AppColors.mainWhiteColor,
            height: 25,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
