import 'package:flutter/material.dart';

class MyPageFunctionList extends StatelessWidget {
  const MyPageFunctionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.orange, width: 2.0), // 위쪽 실선
          bottom: BorderSide(color: Colors.orange, width: 2.0), // 아래쪽 실선
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSettingsItem("포즈 정렬 수정"),
          _buildDottedDivider(),
          _buildSettingsItem("환경설정"),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.orange,
            size: 24.0, // 더 큰 아이콘 크기
          ),
        ],
      ),
    );
  }

  Widget _buildDottedDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: List.generate(
            150 ~/ 5,
            (index) => Expanded(
                  child: Container(
                    color: index % 2 == 0 ? Colors.transparent : Colors.orange,
                    height: 1,
                  ),
                )),
      ),
    );
  }
}
