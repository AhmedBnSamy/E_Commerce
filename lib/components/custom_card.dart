import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final String image;
  const CustomCard({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300)),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(
            width: 20,
          ),
          Text(text)
        ],
      ),
    );
  }
}
