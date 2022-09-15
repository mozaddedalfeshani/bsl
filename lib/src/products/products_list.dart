import 'package:bsl/utils/constants.dart';

class Products {
  final List<Product> _kids = List<Product>.generate(
    22, // number = kids number.
    (index) => Product(
      "https://$imageUrl/Ladis_dress_git/Picture-${index + 1}.jpg",
    ),
  );

  List<Product> get kids => _kids;
  final List<Product> _menS = List<Product>.generate(
    15, // number = mens number.
    (index) => Product(
      "https://$imageUrl/mens_dress/Picture-${index + 1}.jpg",
    ),
  );

  List<Product> get menS => _menS;
  final List<Product> _womenS = List<Product>.generate(
    22,
    (index) => Product(
      "https://$imageUrl/Ladis_dress_git/Picture-${index + 1}.jpg",
    ),
  );
  List<Product> get womenS => _womenS;
}

class Product {
  Product(this.imageSrc, {this.name = ""});
  final String name;
  final String imageSrc;
}
