import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/colors/app_colors.dart';
import 'package:frontend/pages/search_page.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/models/search_content_dto.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({
    super.key,
    required this.isComeFromHome,
    required this.isDrama,
    this.hint,
  });

  final bool isComeFromHome;
  final bool isDrama;
  final String? hint;

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController textEditingController = TextEditingController();
  late String keyword;

  @override
  void initState() {
    super.initState();
    textEditingController.text = widget.hint ?? '';
    keyword = widget.hint ?? '';
  }

  void _onSearchIconTapped() async {
    String type = widget.isDrama ? 'Drama' : 'Movie';
    SearchContentResponse? data = await APIService.search(keyword, type);

    if (widget.isComeFromHome) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchPage(
              isDrama: widget.isDrama,
              hint: textEditingController.text,
              searchContentResponse: data,
            ),
          ),
        );
      });
    } else {
      // 홈에서 오지 않은 경우의 처리
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: widget.hint ?? '다양한 컨텐츠들을 검색해보아요.',
              suffixIcon: InkWell(
                onTap: _onSearchIconTapped,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    width: 20,
                    height: 20,
                    color: AppColors.mainOrangeColor,
                  ),
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                borderSide: BorderSide(
                  color: AppColors.mainOrangeColor,
                  width: 3.0,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                borderSide: BorderSide(
                  color: AppColors.mainOrangeColor,
                  width: 3.0,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                borderSide: BorderSide(
                  color: AppColors.mainOrangeColor,
                  width: 3.0,
                ),
              ),
            ),
            onChanged: (text) {
              setState(() {
                keyword = text;
              });
            },
          ),
        ],
      ),
    );
  }
}
