import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/colors/app_colors.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: '다양한 컨텐츠들을 검색해보아요.',
              suffixIcon: Padding(
                padding: const EdgeInsets.all(10.0), // 아이콘 여백 조정
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                  width: 20, // SVG 아이콘의 크기를 조정
                  height: 20,
                  color: AppColors.mainOrangeColor, // 아이콘 색상 설정
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  color: AppColors.mainOrangeColor,
                  width: 3.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  color: AppColors.mainOrangeColor,
                  width: 3.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  color: AppColors.mainOrangeColor,
                  width: 3.0,
                ),
              ),
            ),
            onChanged: (text) {
              // 검색어가 입력될 때 수행할 동작
            },
          ),
        ],
      ),
    );
  }
}
