import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  ProductItem _productItem;

  ProductItem get productItem => _productItem;

  set productItem(ProductItem value) {
    _productItem = value;
    notifyListeners();
  }
}

@immutable
class ProductItem {
  final String id;
  final String name;
  final String category;
  final String detail;
  final String imagePath;
  final String subcategory;
  final double discount;
  final double price;
  final bool bestSeller;
  final bool featured;

  ProductItem(
      this.id,
      this.bestSeller,
      this.category,
      this.detail,
      this.discount,
      this.featured,
      this.imagePath,
      this.name,
      this.price,
      this.subcategory);
}

/*final featuredProductsList = [
  ProductModel(
      name: 'Electrolitos Oral Coco 500Ml',
      detail: 'Electrolitos Orales Sabor Coco 500Ml',
      price: 17.90,
      discount: 0,
      featured: false,
      imagePath: 'assets/images/productos/solural.png'),
  ProductModel(
      name: 'Miconazol Crema',
      detail: 'Miconazol Crema 20 g. Miconazol 2%',
      price: 14.39,
      discount: 0,
      featured: false,
      imagePath: 'assets/images/productos/miconazol.png'),
  ProductModel(
      name: 'Evra Parche Cutáneo',
      detail:
          'Evra Parche Cutáneo 3 U (6 mg/.6 mg). Norelgestromina 86 mg)/Etinilestradiol (.6 mg)',
      price: 378.00,
      discount: 0,
      featured: false,
      imagePath: 'assets/images/productos/evra.png'),
  ProductModel(
      name: 'Diane -35',
      detail:
          'Diane 21 Tab (2.00 mg/0.035 mg). Ciproterona (2.00 mg) /Etinilestradiol (0.035 mg)',
      price: 368.55,
      discount: 0,
      featured: false,
      imagePath: 'assets/images/productos/diane.png'),
  ProductModel(
      name: 'Espavén Pediátrico',
      detail:
          'Espavén Espavén Pediátrico Suspensión 30 mL (100 mg). Dimeticona (100 mg)',
      price: 164.85,
      discount: 0,
      featured: false,
      imagePath: 'assets/images/productos/espaven.png'),
];

final featuredProductsList2 = [
  ProductModel(
      name: 'Electrolitos Oral Coco 500Ml',
      detail: 'Electrolitos Orales Sabor Coco 500Ml',
      price: 17.90,
      discount: 20.00,
      featured: false,
      imagePath: 'assets/images/productos/solural.png'),
  ProductModel(
      name: 'Miconazol Crema',
      detail: 'Miconazol Crema 20 g. Miconazol 2%',
      price: 14.39,
      discount: 15.00,
      featured: false,
      imagePath: 'assets/images/productos/miconazol.png'),
  ProductModel(
      name: 'Evra Parche Cutáneo',
      detail:
          'Evra Parche Cutáneo 3 U (6 mg/.6 mg). Norelgestromina 86 mg)/Etinilestradiol (.6 mg)',
      price: 378.00,
      discount: 0,
      featured: false,
      imagePath: 'assets/images/productos/evra.png'),
  ProductModel(
      name: 'Diane -35',
      detail:
          'Diane 21 Tab (2.00 mg/0.035 mg). Ciproterona (2.00 mg) /Etinilestradiol (0.035 mg)',
      price: 368.55,
      discount: 0,
      featured: false,
      imagePath: 'assets/images/productos/diane.png'),
  ProductModel(
      name: 'Espavén Pediátrico',
      detail:
          'Espavén Espavén Pediátrico Suspensión 30 mL (100 mg). Dimeticona (100 mg)',
      price: 164.85,
      discount: 0,
      featured: false,
      imagePath: 'assets/images/productos/espaven.png'),
  ProductModel(
      name: 'Electrolitos Oral Coco 500Ml',
      detail: 'Electrolitos Orales Sabor Coco 500Ml',
      price: 17.90,
      discount: 0,
      featured: false,
      imagePath: 'assets/images/productos/solural.png'),
  ProductModel(
      name: 'Miconazol Crema',
      detail: 'Miconazol Crema 20 g. Miconazol 2%',
      price: 14.39,
      discount: 0,
      featured: false,
      imagePath: 'assets/images/productos/miconazol.png'),
  ProductModel(
      name: 'Evra Parche Cutáneo',
      detail:
          'Evra Parche Cutáneo 3 U (6 mg/.6 mg). Norelgestromina 86 mg)/Etinilestradiol (.6 mg)',
      price: 378.00,
      discount: 0,
      featured: false,
      imagePath: 'assets/images/productos/evra.png'),
  ProductModel(
      name: 'Diane -35',
      detail:
          'Diane 21 Tab (2.00 mg/0.035 mg). Ciproterona (2.00 mg) /Etinilestradiol (0.035 mg)',
      price: 368.55,
      discount: 0,
      featured: false,
      imagePath: 'assets/images/productos/diane.png'),
  ProductModel(
      name: 'Espavén Pediátrico',
      detail:
          'Espavén Espavén Pediátrico Suspensión 30 mL (100 mg). Dimeticona (100 mg)',
      price: 164.85,
      discount: 200.00,
      featured: false,
      imagePath: 'assets/images/productos/espaven.png'),
];*/
