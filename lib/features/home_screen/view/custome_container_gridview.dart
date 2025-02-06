import 'package:flutter/material.dart';
import '../../../generated/assets.dart';
import '../model/product_model.dart';

class CustomContainerGridview extends StatelessWidget {
  const CustomContainerGridview({
    super.key,
    required this.nameProduct,
    required this.priceProduct,
    this.priceOldProduct,
    required this.image,
    this.discount,
    this.rating = 5, // Default rating to 5
  });

  final String nameProduct;
  final String priceProduct;
  final String? priceOldProduct;
  final String? discount;
  final ImageProvider image;
  final int rating; // Add a rating parameter

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.zero,
            width: 170,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Image(
                  image: image,
                  fit: BoxFit.cover,
                  width: 100,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              nameProduct,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: List.generate(
                5,
                    (index) => Icon(
                  Icons.star,
                  color: index < rating ? Colors.yellow : Colors.grey,
                  size: 15,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              priceProduct,
              style: const TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 5),
          if (priceOldProduct != null && discount != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: priceOldProduct,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const WidgetSpan(child: SizedBox(width: 10)),
                    TextSpan(
                      text: discount,
                      style: const TextStyle(
                        color: Color(0xffd10f0f),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class CustomContainerGridViewList extends StatelessWidget {
  CustomContainerGridViewList({super.key});

  final List<ProductSaleRating> products = [
    ProductSaleRating(
      image: AssetImage(Assets.productImageRedBag),
      nameProduct: "Nike Air Max 270 React experimental",
      priceProduct: "20\$",
      priceOldProduct: "\$534.33",
      discount: "20% off",
      rating: 4,
    ),
    ProductSaleRating(
      image: AssetImage(Assets.productImageColorsShoes),
      nameProduct: "Nike Air Max 270 React new edition",
      priceProduct: "25\$",
      priceOldProduct: "\$500.00",
      discount: "10% off",
      rating: 5,
    ),
    ProductSaleRating(
      image: AssetImage(Assets.productImageBegBag),
      nameProduct: "Nike Air Max 270 React classic",
      priceProduct: "18\$",
      priceOldProduct: "\$450.00",
      discount: "15% off",
      rating: 3,
    ),
    ProductSaleRating(
      image: AssetImage(Assets.productImageBlackBag),
      nameProduct: "Nike Air Max 270 React black",
      priceProduct: "30\$",
      priceOldProduct: "\$600.00",
      discount: "5% off",
      rating: 5,
    ),
    ProductSaleRating(
      image: AssetImage(Assets.productImageRedBag),
      nameProduct: "Nike Air Max 270 React experimental",
      priceProduct: "20\$",
      priceOldProduct: "\$534.33",
      discount: "20% off",
      rating: 4,
    ),
    ProductSaleRating(
      image: AssetImage(Assets.productImageColorsShoes),
      nameProduct: "Nike Air Max 270 React new edition",
      priceProduct: "25\$",
      priceOldProduct: "\$500.00",
      discount: "10% off",
      rating: 5,
    ),
    ProductSaleRating(
      image: AssetImage(Assets.productImageBegBag),
      nameProduct: "Nike Air Max 270 React classic",
      priceProduct: "18\$",
      priceOldProduct: "\$450.00",
      discount: "15% off",
      rating: 3,
    ),
    ProductSaleRating(
      image: AssetImage(Assets.productImageBlackBag),
      nameProduct: "Nike Air Max 270 React black",
      priceProduct: "30\$",
      priceOldProduct: "\$600.00",
      discount: "5% off",
      rating: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Allows GridView to fit within constraints
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7, // Adjusted ratio to prevent overflow
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => CustomContainerGridview(
        nameProduct: products[index].nameProduct,
        priceProduct: products[index].priceProduct,
        priceOldProduct: products[index].priceOldProduct,
        image: products[index].image,
        discount: products[index].discount,
        rating: products[index].rating,
      ),
    );
  }
}