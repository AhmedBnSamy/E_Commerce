
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import 'custom_container_time.dart';

class CustomContainerCommerce extends StatelessWidget {
  const CustomContainerCommerce({super.key,  this.image,  this.textTitle,  this.textSubTitle,  this.additionalInfo});
  final ImageProvider? image ;
  final String? textTitle;
  final String? textSubTitle;
  final Widget? additionalInfo;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image ?? AssetImage(Assets.productImageRedShoesBackground),
          fit: BoxFit.cover,
          colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
        ),
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textTitle!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              textSubTitle!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(child: additionalInfo ?? RowTime()),
          ],
        ),
      ),
    );
  }
}

class RowTime extends StatelessWidget {
  const RowTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomContainerTime(
          time: "08",
        ),
        SizedBox(
          width: 10,),
        Text(":",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          width: 10,),
        CustomContainerTime(
          time: "34",
        ),
        SizedBox(
          width: 10,),
        Text(":",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
        ),
        SizedBox(
          width: 10,),
        CustomContainerTime(time:'52' , ),

      ],
    );
  }
}


