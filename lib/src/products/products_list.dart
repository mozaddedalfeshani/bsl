class Products {
  final List<Product> _menS = [
    for (int i = 0; i <= 50; i++) ...[
      Product("Men's Shirt $i", "image.jpg"),
    ],
  ];

  List<Product> get menS => _menS;
  final List<Product> _womenS = [
    // for (int i = 0; i <= 50; i++) ...[
    //   Product("Women's Shirt $i", "image.jpg"),
    // ],
    //Product("men", "assets/road-1072821__480.jpg"),
  ];
  List<Product> get womenS => _womenS;
}

class Product {
  Product(this.name, this.image);
  final String name;
  final String image;
}
