import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    required this.ItemName,
    required this.ItemCost,
    Key? key,
    required this.ImageUrl,
  }) : super(key: key);
  final String ImageUrl;
  final String ItemCost;
  final String ItemName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text(ItemName),),
      body: Column(
        children: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(tag: "anim",
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(ImageUrl))),
            ),
          ),
        ),
        
        ],
      ),
    );
  }
}
