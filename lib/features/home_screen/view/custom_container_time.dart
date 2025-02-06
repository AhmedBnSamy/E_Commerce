
import 'package:flutter/material.dart';

class CustomContainerTime extends StatelessWidget {
  const CustomContainerTime({
    super.key, required this.time,
  });

  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          time,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
