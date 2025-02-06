
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/generated/assets.dart';
import 'package:flutter/material.dart';

import 'custom_container_commerce.dart';

class CustomSliderHomePage extends StatefulWidget {
  const CustomSliderHomePage({super.key});

  @override
  State<CustomSliderHomePage> createState() => _CustomSliderHomePageState();
}

class _CustomSliderHomePageState extends State<CustomSliderHomePage> {
  int currentIndex = 0;

  List<Widget> getWidgets() {
    return [
      CustomContainerCommerce(
        textTitle: "Super Flash Sale",
        textSubTitle: "50% off",
      ),
      CustomContainerCommerce(
        textTitle: "Ahmed Samy",
        textSubTitle: "95% off",
        image: AssetImage(Assets.productImageBlueShoes),
      ),
      CustomContainerCommerce(
        textTitle: "Ammar Samy",
        textSubTitle: "90% off",
        additionalInfo: Text("New Arrivals",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
        image: AssetImage(Assets.productImageColorsShoes),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: CarouselSliderController(),
          itemCount: getWidgets().length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
          getWidgets()[itemIndex],
          options: CarouselOptions(
            height: 250,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 3,
            animateToClosest: true,
            pauseAutoPlayOnTouch: true,
            pageSnapping: true,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 10,),
        DotsIndicator(
          dotsCount: getWidgets().length,
          position: currentIndex,
          decorator: const DotsDecorator(
            activeColor: Colors.blueAccent,
            color: Colors.black26,
            spacing: EdgeInsets.symmetric(horizontal: 4),
            activeSize: Size(10, 10),
            size: Size(8, 8),
          ),
        )
      ],
    );
  }
}
