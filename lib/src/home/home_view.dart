import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: LayoutBuilder(builder: (context, constrains) {
        return Card(
          elevation: 10,
          child: ListView(
            children: [
              ConstrainedBox(
                constraints:
                    BoxConstraints(maxHeight: constrains.maxHeight * 0.75),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: PageView(
                    controller: _pageViewController,
                    children: [
                      Image.asset(
                        "assets/road-1072821__480.jpg",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/download.jpg",
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      _pageViewController.animateToPage(
                        0,
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        curve: Curves.ease,
                      );
                    },
                    icon: const Icon(Icons.circle),
                  ),
                  IconButton(
                    onPressed: () {
                      _pageViewController.animateToPage(
                        1,
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        curve: Curves.ease,
                      );
                    },
                    icon: const Icon(Icons.circle),
                  ),
                ],
              ),
              const Text(
                  "Basic Shirts Ltd. established in 2001,is situated in Dhaka,Bangladesh.With a total sewing workforce of 2400,Basic is a formidable player in garment making in the region. In order to support improved working conditions for its staff.The board of Basic Shirt has invested in a brands new,state of the art manufacturing facility in Gazipur,Dhaka.Known as Basic Tower, this newly built,6 story,single occupancy facility brings with in the latest new thinking and practices,taking Basic Shirts forward in all aspects of improved product quality,consistency and variety,as well as becoming the company of choice for local working people."),
            ],
          ),
        );
      }),
    );
  }
}
