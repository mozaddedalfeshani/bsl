class Products {
  final List<Product> _all =
      Iterable<int>.generate(22) // generate == last value.
          .map((e) => Product(
                "Jack & Sones",
                "https://github.com/mozaddedalfeshani/bslphotos/raw/main/Ladis_dress_git/Picture-${e + 1}.jpg",
              ))
          .toList();
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
