import 'package:flutter/material.dart';

class SelectableCircle extends StatefulWidget {
  final String contentTitle;
  final String contentImage;
  final VoidCallback onTap; // 추가된 onTap 콜백

  const SelectableCircle({
    Key? key,
    required this.contentTitle,
    required this.contentImage,
    required this.onTap, // onTap 콜백을 받아옴
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
      onTap: () {
        _toggleSelection();
        widget.onTap(); // 탭 시 onTap 콜백 호출
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // 이미지가 들어간 원
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(widget.contentImage),
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
          Text(
            widget.contentTitle,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
