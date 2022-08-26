// import 'package:bsl/src/products/products_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  // final Products _productList = Products();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        child: LayoutBuilder(builder: (context, _) {
          return Swiper(
            key: UniqueKey(),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            layout: SwiperLayout.STACK,
            itemHeight: 500,
            itemWidth: 300,
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: Theme.of(context).colorScheme.onSurface,
                activeColor: Theme.of(context).colorScheme.primary,
              ),
              alignment: Alignment.bottomCenter,
            ),
            itemBuilder: (context, index) {
              return const ProductCard();
            },
          );
        }),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 3 / 5,
      child: Card(),
    );
  }
}
