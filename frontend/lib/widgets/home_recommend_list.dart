import 'package:flutter/material.dart';

class HomeRecommendList extends StatefulWidget {
  const HomeRecommendList({super.key});

  @override
  _HomeRecommendListState createState() => _HomeRecommendListState();
}

class _HomeRecommendListState extends State<HomeRecommendList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              width: 150,
              height: 150,
              margin: const EdgeInsets.all(8),
              color: Colors.greenAccent,
            ),
            Text(
              'Item $index',
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        );
      },
    );
  }
}
