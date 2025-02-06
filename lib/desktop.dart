import 'package:flutter/material.dart';

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child:  Container(
              height: double.infinity,
              color: Colors.lightBlue,
            ),
          ),
          Expanded(

            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
            
            )
              ],
                  ),
          ),
    ]) );
  }
}
