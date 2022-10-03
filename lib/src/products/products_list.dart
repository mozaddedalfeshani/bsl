import 'package:bsl/utils/constants.dart';

class Products {
  //kids section
  //edited
  final List<Product> _kids = List<Product>.generate(
    8, // number = kids number.
    (index) => Product(
      "https://$imageUrl/kids/Picture-${index + 1}.jpg",
    ),
  );

  //mens section
  //edited
  List<Product> get kids => _kids;
  final List<Product> _menS = List<Product>.generate(
    13, // number = mens number.
    (index) => Product(
      "https://$imageUrl/mens_beta/Picture-${index + 1}.jpg",
    ),
  );

  //woman section
  //edited
  List<Product> get menS => _menS;
  final List<Product> _womenS = List<Product>.generate(
    13,
    (index) => Product(
      "https://$imageUrl/woman_beta/Picture-${index + 1}.jpg",
    ),
  );
  List<Product> get womenS => _womenS;
}

class Product {
  Product(this.imageSrc, {this.name = ""});
  final String name;
  final String imageSrc;
}
