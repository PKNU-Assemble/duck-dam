import 'package:flutter/material.dart';

class RecentSearchWord extends StatelessWidget {
  const RecentSearchWord({super.key});

  // final String text;
  // final VoidCallback onDelete;

  // const RecentSearchWord({
  //   Key? key,
  //   required this.text,
  //   required this.onDelete,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent.shade100,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Flexible(
              child: Text(
                "안녕안녕안녕안녕안녕",
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(width: 4.0),
            GestureDetector(
              // onTap: ,
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
