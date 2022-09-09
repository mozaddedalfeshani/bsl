import 'package:bsl/utils/constants.dart';

class Products {
  final List<Product> _all = List<Product>.generate(
    22,
    (index) => Product(
      "Jack & Sones",
      "https://$imageUrl/Ladis_dress_git/Picture-${index + 1}.jpg",
    ),
  );
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
