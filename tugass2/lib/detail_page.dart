import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'model/zara.dart';

class DetailPage extends StatelessWidget {
  // final Movie movie;
  final String image;
  final String name;
  final int price;


  const DetailPage({
    Key? key,
    required this.image,
    required this.name,
    this.price = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30.0),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Image.network(image),
              SizedBox(height: 16,),
              Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 16,),
              Text("${price}"),
            ],
          ),
        ),
      ),
    );
  }
}
