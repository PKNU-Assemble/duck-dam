import 'package:flutter/material.dart';

class BookmarkListTogle extends StatefulWidget {
  const BookmarkListTogle({Key? key}) : super(key: key);

  @override
  _BookmarkListTogleState createState() => _BookmarkListTogleState();
}

class _BookmarkListTogleState extends State<BookmarkListTogle> {
  bool isExpanded = false;

  void _toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "오리님의 관심있는 컨텐츠",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(isExpanded ? Icons.remove : Icons.add),
                onPressed: _toggleExpand,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 한 줄에 3개의 항목
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1, // 정사각형 비율
            ),
            itemCount: isExpanded ? 9 : 3, // 확장 여부에 따른 항목 수
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "도덕과 역대사이",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
