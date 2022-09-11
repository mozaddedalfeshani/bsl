import 'package:bsl/src/products/products_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 350,
            ),
            child: CupertinoSegmentedControl<int>(
              groupValue: _index,
              children: const {
                0: Text("Man's"),
                1: Text("Woman's"),
                2: Text("Kid's"),
              },
              onValueChanged: (value) {
                if (_index == value) {
                  return;
                }
                setState(
                  () {
                    _index = value;
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          child: [
            ProductsSlideView(
              key: const ValueKey("mans"),
              list: Products().menS,
            ),
            ProductsSlideView(
              key: const ValueKey("womans"),
              list: Products().womenS,
            ),
            ProductsSlideView(
              key: const ValueKey("kids"),
              list: Products().kids,
            ),
          ][_index],
        ),
      ],
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
                child: CachedNetworkImage(
                  // src,
                  imageUrl: src,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) {
                    return Center(
                        child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ));
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

class ProductsSlideView extends StatelessWidget {
  const ProductsSlideView({super.key, required List<Product> list})
      : _list = list;
  final List<Product> _list;

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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return CarouselSlider.builder(
                    itemCount: _list.length,
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: (3 / 5) /
                          (constraints.maxWidth / constraints.maxHeight),
                      aspectRatio: 3 / 5,
                      autoPlay: true,
                    ),
                    itemBuilder: (context, index, secondIndex) {
                      return ProductCard(
                        name: "Product: ${index + 1}/${_list.length}",
                        src: _list[index].imageSrc,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
