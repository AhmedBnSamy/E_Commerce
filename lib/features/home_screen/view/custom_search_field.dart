import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(5),
                  hintText: "Search products",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blueAccent,
                  )),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.favorite_border_outlined,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.notification_add_outlined,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}