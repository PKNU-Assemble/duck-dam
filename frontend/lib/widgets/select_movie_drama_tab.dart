import 'package:flutter/material.dart';

class SelectMovieDramaTab extends StatefulWidget {
  const SelectMovieDramaTab({super.key});

  @override
  _SelectMovieDramaTabState createState() => _SelectMovieDramaTabState();
}

class _SelectMovieDramaTabState extends State<SelectMovieDramaTab>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: const [
        Tab(text: '영화'),
        Tab(text: '드라마'),
      ],
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.orange,
            width: 4.0,
          ),
        ),
      ),
      indicatorSize: TabBarIndicatorSize.tab, // 이 속성으로 인디케이터 크기를 탭 크기에 맞춤
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
    );
  }
}
