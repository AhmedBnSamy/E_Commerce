import 'package:flutter/material.dart';

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Column(
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
            ])
    );
  }
}
