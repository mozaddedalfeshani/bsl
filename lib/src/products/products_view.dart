import 'package:bsl/src/products/products_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final Products _productList = Products();
  final ScrollController _productScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Scrollbar(
        controller: _productScrollController,
        child: ListView(
          padding: const EdgeInsets.all(50),
          controller: _productScrollController,
          scrollDirection: Axis.horizontal,
          children: [
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
          ],
        ),
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
