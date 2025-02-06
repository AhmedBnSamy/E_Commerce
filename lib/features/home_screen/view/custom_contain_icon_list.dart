import 'package:ecommerce_app/generated/assets.dart';
import 'package:flutter/material.dart';
import '../model/product_model.dart';

class CustomContainerIconList extends StatelessWidget {
  CustomContainerIconList({super.key});

  final List<Product> products = [
    Product(
      text: 'Man Shirt',
      image: AssetImage(Assets.productIconShirt),
    ),
    Product(
      text: 'Women bag',
      image: AssetImage(Assets.productIconWomanBag),
    ),
    Product(
      text: 'Man Pants',
      image: AssetImage(Assets.productIconManPants),
    ),
    Product(
      text: 'Man work \nEquipment',
      image: AssetImage(Assets.productIconWomanShoes),
    ),
    Product(
      text: 'Man Shirt',
      image: AssetImage(Assets.productIconShirt),
    ),
    Product(
      text: 'Women bag',
      image: AssetImage(Assets.productIconWomanBag),
    ),
    Product(
      text: 'Man Pants',
      image: AssetImage(Assets.productIconManPants),
    ),
    Product(
      text: 'Women Shoes',
      image: AssetImage(Assets.productIconWomanShoes),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140, // Fixed height for the horizontal scrolling section
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomContainerIcon(
              text: products[index].text,
              image: products[index].image,
            ),
          );
        },
      ),
    );
  }
}

class CustomContainerIcon extends StatelessWidget {
  const CustomContainerIcon({super.key, required this.text, required this.image});
  final String text ;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.zero,
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              color: Colors.white60,
              borderRadius: BorderRadius.circular(60)),
          child: Center(
            child: Image(image: image,width: 40,),
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height:40, child: Text(text,style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold,),maxLines: 2,)),

      ],
    );
  }
}
