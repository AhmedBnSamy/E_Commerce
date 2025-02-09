import 'package:flutter/material.dart';

class Product {
  final String text;
  final ImageProvider image;

  Product({required this.text, required this.image});
}

class ProductSale {
  final String nameProduct;
  final String priceProduct;
  final String? priceOldProduct;
  final String? discount;
  final ImageProvider image;

  ProductSale(this.priceOldProduct, this.discount,  {
    required this.nameProduct,
    required this.priceProduct,
    required this.image,
  });
}

class ProductSaleRating {
  final String nameProduct;
  final String priceProduct;
  final String priceOldProduct;
  final String discount;
  final ImageProvider image;
  final int rating;

  ProductSaleRating( {
    required this.nameProduct,
    required this.priceProduct,
    required this.image,
    required this.priceOldProduct,required this.discount,required this.rating,
  });
}