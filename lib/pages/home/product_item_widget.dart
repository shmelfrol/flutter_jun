import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jun/pages/home/HomePage.dart';
import 'package:flutter_jun/router/app_router.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    required this.rating,
    required this.name,
    required this.price,
    this.width,
    required this.id
  });

  final double rating;
  final String name;
  final int price;
  final double? width;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width ?? width,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                      decoration: const BoxDecoration(
                        image:  DecorationImage(
                  image: AssetImage("assets/images/product.png")
                  ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingWidget(rating: rating,),
                        ],
                      ),
                                  ),
                    ),
                
                 Column(children: [
                 Center(
                  child: FittedBox(
                   fit: BoxFit.fitWidth, 
                   child: Text(name, style: const TextStyle(
                     fontSize: 15
                   ),)
                   )
                 ),
                 Text(price.toString(), style: const TextStyle(
                  fontSize: 18
                 ),),
                 ],)
                 
                ],
              ),
            ),
            InkWell(
              onTap: () {
               context.router.push(ProductRoute(id: id));
              },
            )
          ],
        )
        ),
    );
  }
}
