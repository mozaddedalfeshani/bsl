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
                constraints: BoxConstraints(
                    maxHeight: (constrains.maxWidth < constrains.maxHeight)
                        ? constrains.maxWidth
                        : constrains.maxHeight * 0.60),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      PageView(
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
                      Positioned(
                        bottom: 3,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SliderButton(
                              totalPages: 2,
                              pageViewController: _pageViewController,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "Basic Shirts Ltd. established in 2001,is situated in Dhaka,Bangladesh.With a total sewing workforce of 2400,Basic is a formidable player in garment making in the region. In order to support improved working conditions for its staff.The board of Basic Shirt has invested in a brands new,state of the art manufacturing facility in Gazipur,Dhaka.Known as Basic Tower, this newly built,6 story,single occupancy facility brings with in the latest new thinking and practices,taking Basic Shirts forward in all aspects of improved product quality,consistency and variety,as well as becoming the company of choice for local working people."),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class SliderButton extends StatelessWidget {
  const SliderButton({
    Key? key,
    required PageController pageViewController,
    required int totalPages,
  })  : _pageViewController = pageViewController,
        _totalPages = totalPages,
        super(key: key);

  final PageController _pageViewController;
  final int _totalPages;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25 * _totalPages.toDouble(),
      child: AnimatedBuilder(
          animation: _pageViewController,
          builder: (context, _) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: NavigationBarTheme(
                data: NavigationBarThemeData(
                  // backgroundColor: Colors.transparent,
                  height: 20,
                  // indicatorColor: Colors.transparent,
                  iconTheme: MaterialStateProperty.all(
                    const IconThemeData(
                      size: 15,
                    ),
                  ),
                ),
                child: NavigationBar(
                  height: 23,
                  selectedIndex: (_pageViewController.page ?? 0).toInt(),
                  onDestinationSelected: (value) {
                    _pageViewController.animateToPage(
                      value,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.circle_outlined),
                      selectedIcon: Icon(Icons.circle),
                      label: "",
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.circle_outlined),
                      selectedIcon: Icon(Icons.circle),
                      label: "",
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}