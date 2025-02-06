
import 'package:ecommerce_app/features/home_screen/view/custom_contain_icon_list.dart';
import 'package:ecommerce_app/features/home_screen/view/custom_container_commerce.dart';
import 'package:ecommerce_app/features/home_screen/view/custom_container_product_list.dart';
import 'package:ecommerce_app/features/home_screen/view/custome_container_gridview.dart';
import 'package:flutter/material.dart';
import '../../generated/assets.dart';
import 'model/product_model.dart';
import 'view/custom_slider_homepage.dart';
import 'view/custom_search_field.dart';
import 'view/custom_text_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CustomSearchField(),
          Divider(
            thickness: 0.4,
          ),
          CustomSliderHomePage(),
          SizedBox(
            height: 20,),
          CustomTextRow(textRight: "Categories", textLeft: "More Categories",),
          SizedBox(height: 20,),
          CustomContainerIconList(),
          SizedBox(height: 20,),
          CustomTextRow(textRight: "Flash Sale", textLeft: "See More",),
          SizedBox(height: 20,),
          CustomContainerSaleProductList(),
          SizedBox(height: 20,),
          CustomTextRow(textRight: "Mega Sale", textLeft: "See More",),
          SizedBox(height: 20,),
          CustomContainerSaleProductList(),
          SizedBox(height: 20,),
          CustomContainerCommerce(
            image: AssetImage(Assets.productImageShoesBackground),
            textTitle: "Recommended",
            textSubTitle: "Product",
            additionalInfo: Text("We recommend the best for you",style: TextStyle(color: Colors.white70,fontSize: 14,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 20,),
          CustomContainerGridViewList(),
       
        ],
      ),
              ),
            ),
    );
  }
}
