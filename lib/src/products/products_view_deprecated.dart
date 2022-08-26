import 'package:bsl/src/products/products_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  int _index = 0;
  final Products _productList = Products();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 250),
              child: CupertinoSegmentedControl<int>(
                groupValue: _index,
                children: const {
                  0: Text("Men's"),
                  1: Text("Women's"),
                },
                onValueChanged: (value) {
                  setState(() {
                    _index = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, constrains) {
              List<Product> products =
                  [_productList.menS, _productList.womenS][_index];
              return GridView.builder(
                key: UniqueKey(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: constrains.maxWidth ~/ 250 + 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Container(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          child: SizedBox.expand(
                            child: Image.asset(
                              products[index].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(0.75),
                            child: Text(
                              " ${products[index].name}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
