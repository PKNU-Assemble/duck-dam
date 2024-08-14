import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/colors/app_colors.dart';
import 'package:frontend/models/content_detail.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/widgets/custom_bottom_navigation_bar.dart';
import 'package:frontend/widgets/detail_app_bar.dart';
import 'package:frontend/pages/camera_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.contentId});

  final int contentId;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ContentDetail? contentDetail;
  String contentName = '';

  @override
  void initState() {
    super.initState();
    print(widget.contentId);
    _fetchContentDetails();
  }

  Future<void> _fetchContentDetails() async {
    ContentDetail? fetchedContent =
        await APIService.getContentDetail(widget.contentId);
    print(fetchedContent);
    setState(() {
      contentDetail = fetchedContent;
      contentName = contentDetail!.contentTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const DetailAppBar(),
      body: contentDetail == null
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 400.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          contentDetail!.contentImage,
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
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    contentDetail!.contentTitle,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    contentDetail!.year,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/location.svg',
                                      color: AppColors.mainWhiteColor,
                                      height: 20,
                                    ),
                                    const SizedBox(
                                        width: 8.0), // 아이콘과 첫 번째 버튼 사이 간격
                                    ...contentDetail!.addressTag.map((tag) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: _buildLocationButton(tag),
                                      );
                                    }).toList(),
                                  ],
                                ),
                              )
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
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: contentDetail!.placeDtos.length,
                      itemBuilder: (context, index) {
                        final place = contentDetail!.placeDtos[index];
                        return _buildListItem(
                          index + 1,
                          place.placeImage,
                          place.placeName,
                          place.placeOverview,
                          place.placeAddress,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget _buildListItem(int index, String placeImage, String title,
      String description, String placeAddress) {
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
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  image: DecorationImage(
                    image: NetworkImage(placeImage),
                    fit: BoxFit.cover,
                  ),
                ),
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
                    Row(
                      children: [
                        const Icon(
                          Icons.place,
                          color: Colors.grey,
                          size: 14.0,
                        ),
                        const SizedBox(width: 4.0),
                        Expanded(
                          child: Text(
                            placeAddress,
                            style: const TextStyle(
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
              InkWell(
                child: SvgPicture.asset('assets/icons/camera.svg'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraPage(
                        imagePath: contentName == '극한직업'
                            ? 'assets/images/frame1.png'
                            : 'assets/images/frame2.png',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.orange,
          thickness: 2.0,
          height: 32.0,
        ),
      ],
    );
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
}
