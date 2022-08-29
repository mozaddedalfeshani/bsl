class Products {
  final List<Product> _all = [
    Product("Jack & Sones", "assets/shirts/images.jpeg"),
    Product("Jack & Sones", "assets/shirts/Unknown.jpeg"),
    Product("Jack & Sones", "assets/shirts/Unknown-1.jpeg"),
  ];
  List<Product> get all => _all;
  final List<Product> _menS = [];

  List<Product> get menS => _menS;
  final List<Product> _womenS = [];
  List<Product> get womenS => _womenS;
}

class Product {
  Product(this.name, this.image);
  final String name;
  final String image;
}
