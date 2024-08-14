import 'package:flutter/material.dart';
import 'package:frontend/colors/app_colors.dart';
import 'package:frontend/models/content_dto.dart';
import 'package:frontend/colors/app_colors.dart';
import 'package:frontend/pages/detail_page.dart';

class HomeRecommendList extends StatefulWidget {
  const HomeRecommendList(
      {super.key, required this.contentDtos, required this.type});

  final List<ContentDto> contentDtos;
  final int type;

  @override
  _HomeRecommendListState createState() => _HomeRecommendListState();
}

class _HomeRecommendListState extends State<HomeRecommendList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.contentDtos.length,
      itemBuilder: (context, index) {
        final content = widget.contentDtos[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(
                        contentId: content.contentId!,
                      )),
            );
          },
          child: Column(
            children: [
              Container(
                width: 150,
                height: 200,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  image: DecorationImage(
                    image: NetworkImage(content.contentImage!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                content.contentTitle!,
                style: const TextStyle(
                    color: AppColors.boldFontsColor, fontSize: 13),
              ),
              widget.type == 1
                  ? Text(
                      content.address!,
                      style: const TextStyle(
                          color: AppColors.thinFontsColor, fontSize: 11),
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}
