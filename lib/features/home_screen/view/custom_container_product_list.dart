
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../model/product_model.dart';

class CustomContainerSaleProduct extends StatelessWidget {
  const CustomContainerSaleProduct({super.key, required this.nameProduct, required this.priceProduct, this.priceOldProduct, required this.image, this.discount});

  final String nameProduct;
  final String priceProduct;
  final String? priceOldProduct;
  final String? discount;
  final ImageProvider image;


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.zero,
        width: 130,
        height: 230,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.zero,
                width: 170,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,top: 16,right: 16,bottom: 16),
                  child: Center(
                    child: Image(
                      image:image,
                      fit: BoxFit.cover,
                      width: 100,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
                child: Text(nameProduct,style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 2,),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
                child: Text(priceProduct,style: TextStyle(color: Colors.lightBlueAccent,fontSize: 13,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 2,),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
                child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text:priceOldProduct,style: TextStyle(color: Colors.grey.shade400,fontSize: 10,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),),
                        WidgetSpan(child: SizedBox(width: 15,),),
                        TextSpan(text:discount ,style: TextStyle(color: Color(0xffd10f0f),fontSize: 10,fontWeight: FontWeight.bold,),),
                      ]
                  ),

                ),

              ) ])    );
  }
}

class CustomContainerSaleProductList extends StatelessWidget {
  CustomContainerSaleProductList({super.key});

  final List<ProductSale> products = [
    ProductSale(
        image: AssetImage(Assets.productImageRedBag),
        nameProduct: "Fs-Nike Air Max 270 React experimental",
        priceProduct: "20\$",
        "\$534,33",
        "20% off"),
    ProductSale(
        image: AssetImage(Assets.productImageColorsShoes),
        nameProduct: "Fs-Nike Air Max 270 React adfasasd",
        priceProduct: "20\$",
        "\$534,33",
        "20% off"),
    ProductSale(
        image: AssetImage(Assets.productImageBegBag),
        nameProduct: "Fs-Nike Air Max 270 React asdsad",
        priceProduct: "20\$",
        "\$534,33",
        "20% off"),
    ProductSale(
        image: AssetImage(Assets.productImageBlackBag),
        nameProduct: "Fs-Nike Air Max 270 React asdasdsa",
        priceProduct: "20\$",
        "\$534,33",
        "20% off"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomContainerSaleProduct(
                image: products[index].image,
                nameProduct: products[index].nameProduct,
                priceProduct: products[index].priceProduct,
                priceOldProduct: products[index].priceOldProduct,
                discount: products[index].discount
            ),
          );
        },
      ),
    );
  }
}


