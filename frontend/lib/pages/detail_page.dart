import 'package:flutter/material.dart';
import 'package:frontend/widgets/custom_bottom_navigation_bar.dart';
import 'package:frontend/widgets/detail_app_bar.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DetailAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/icons/logo.png',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16.0, // 텍스트와 버튼의 위치 조정
                    left: 16.0,
                    right: 16.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '아기 공룡 둘리',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            _buildLocationButton('부산'),
                            const SizedBox(width: 8.0),
                            _buildLocationButton('울산'),
                            const SizedBox(width: 8.0),
                            _buildLocationButton('경남'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // ListView 자체의 스크롤을 막고 전체 페이지 스크롤 사용
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _buildListItem(index + 1, '항목 제목', '항목 설명');
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget _buildListItem(int index, String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            right: 6.0,
            left: 6.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80.0,
                width: 80.0,
                color: Colors.grey,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$index화 / $title',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    const Row(
                      children: [
                        Icon(
                          Icons.place,
                          color: Colors.grey,
                          size: 14.0,
                        ),
                        SizedBox(width: 4.0),
                        Expanded(
                          child: Text(
                            '부산광역시 남구 용소로45 국립부산대학교',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.file_download),
                onPressed: () {
                  // 다운로드 버튼 동작
                },
                alignment: Alignment.center, // 아이콘 위치를 중앙으로 맞춤
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.orange,
          thickness: 2.0,
          height: 32.0, // 항목 위아래 간격을 동일하게 맞추기 위해 높이 설정
        ),
      ],
    );
  }
}

Widget _buildLocationButton(String label) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
    ),
    child: Text(
      label,
      style: const TextStyle(color: Colors.black),
    ),
  );
}
