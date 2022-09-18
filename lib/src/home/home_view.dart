import 'package:bsl/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> _banners = List<String>.generate(
    2,
    (index) => "https://$imageUrl/factory_photos/Front-${index + 1}.jpg",
  );
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return ListView(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: (constrains.maxWidth < constrains.maxHeight)
                    ? constrains.maxWidth
                    : constrains.maxHeight * 0.60),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 300),
                child: LayoutBuilder(builder: (context, constraints) {
                  return CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio:
                            (constrains.maxWidth / constrains.maxHeight),
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        autoPlay: true,
                      ),
                      items: _banners
                          .map<Widget>(
                            (e) => Card(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: SizedBox.expand(
                                  child: CachedNetworkImage(
                                    imageUrl: e,
                                    progressIndicatorBuilder:
                                        (context, url, progress) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: progress.progress,
                                        ),
                                      );
                                    },
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList());
                }),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
                "Basic Shirts Ltd. established in 2001,is situated in Dhaka,Bangladesh.With a total sewing workforce of 2400,Basic is a formidable player in garment making in the region. In order to support improved working conditions for its staff.The board of Basic Shirt has invested in a brands new,state of the art manufacturing facility in Gazipur,Dhaka.Known as Basic Tower, this newly built,6 story,single occupancy facility brings with in the latest new thinking and practices,taking Basic Shirts forward in all aspects of improved product quality,consistency and variety,as well as becoming the company of choice for local working people."),
          ),
        ],
      );
    });
  }
}
