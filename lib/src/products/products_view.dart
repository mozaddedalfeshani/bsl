// import 'package:bsl/src/products/products_list.dart';
import 'package:bsl/src/products/products_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final List<Product> _productList = Products().all;
  // final CarouselController _carouselController = CarouselController();
  // var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: PointerDeviceKind.values.toSet(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return CarouselSlider.builder(
                  itemCount: _productList.length,
                  //carouselController: _carouselController,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    viewportFraction: (3 / 5) /
                        (constraints.maxWidth / constraints.maxHeight),
                    aspectRatio: 3 / 5,
                    autoPlay: true,
                    // onPageChanged: (index, reason) {
                    //   setState(() {
                    //     _index = index;
                    //   });
                    // },
                  ),
                  itemBuilder: (context, index, secondIndex) {
                    return ProductCard(
                      name: "Product: ${index + 1}/${_productList.length}",
                      src: _productList[index].image,
                    );
                  },
                );
              }),
            ),
            // LayoutBuilder(builder: (context, constraints) {
            //   return SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: IntrinsicWidth(
            //       child: ConstrainedBox(
            //         constraints: BoxConstraints(minWidth: constraints.maxWidth),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: Iterable<int>.generate(_productList.menS.length)
            //               .map<Widget>((e) {
            //             return GestureDetector(
            //               onTap: () {
            //                 _carouselController.animateToPage(e);
            //               },
            //               child: Icon(
            //                 Icons.circle,
            //                 color: (e == _index)
            //                     ? Theme.of(context).colorScheme.primary
            //                     : null,
            //               ),
            //             );
            //           }).toList(),
            //         ),
            //       ),
            //     ),
            //   );
            // }),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.name, required this.src})
      : super(key: key);

  final String name;
  final String src;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Card(
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image(
                  // src,
                  image: NetworkImage(src),
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return child;
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
