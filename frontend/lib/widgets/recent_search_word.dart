import 'package:flutter/material.dart';
import 'package:frontend/colors/app_colors.dart';

class RecentSearchWord extends StatelessWidget {
  final String text;

  const RecentSearchWord({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: AppColors.recentSearchColor,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(width: 4.0),
            GestureDetector(
              onTap: () {
                // 삭제 로직 구현
              },
              child: const Icon(
                Icons.cancel,
                size: 16.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
