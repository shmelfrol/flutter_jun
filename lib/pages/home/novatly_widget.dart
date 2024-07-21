import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jun/pages/home/product_item_widget.dart';

class NovatlyWidget extends StatelessWidget {
  const NovatlyWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
     height: screenSize.width/6,
     color: Colors.transparent,
     child: ListView(
       
       scrollDirection: Axis.horizontal,
       physics: const AlwaysScrollableScrollPhysics(),
       children: <Widget>[
         ProductItemWidget(rating: 4, name: "name", price: 50, width: screenSize.width/6, id: 1,),
         ProductItemWidget(rating: 4, name: "name", price: 50, width: screenSize.width/6, id: 1),
         ProductItemWidget(rating: 4, name: "name", price: 50, width: screenSize.width/6, id: 1),
         ProductItemWidget(rating: 4, name: "name", price: 50, width: screenSize.width/6, id: 1),
         ProductItemWidget(rating: 4, name: "name", price: 50, width: screenSize.width/6, id: 1),
         ProductItemWidget(rating: 4, name: "name", price: 50, width: screenSize.width/6, id: 1),
         ProductItemWidget(rating: 4, name: "name", price: 50, width: screenSize.width/6, id: 1),
         ProductItemWidget(rating: 4, name: "name", price: 50, width: screenSize.width/6, id: 1),
         ],


     ),
          );
  }
}
