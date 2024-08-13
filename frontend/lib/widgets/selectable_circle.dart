import 'package:flutter/material.dart';

class SelectableCircle extends StatefulWidget {
  // final String label;

  const SelectableCircle({
    Key? key,
  }) : super(key: key);

  @override
  _SelectableCircleState createState() => _SelectableCircleState();
}

class _SelectableCircleState extends State<SelectableCircle> {
  bool isSelected = false;

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // 회색 원
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey.shade300,
              ),
              // 주황색 테두리가 그려진 원
              if (isSelected)
                CircleAvatar(
                  radius: 37,
                  backgroundColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.orange, width: 3.0),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text("영화",
              style: TextStyle(color: isSelected ? Colors.black : Colors.grey)),
        ],
      ),
    );
  }
}

class CircleGrid extends StatelessWidget {
  const CircleGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 한 줄에 3개의 항목
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1, // 정사각형 비율
      ),
      itemCount: 9, // 예시를 위해 9개의 아이템을 표시
      itemBuilder: (context, index) {
        return const SelectableCircle();
      },
    );
  }
}
