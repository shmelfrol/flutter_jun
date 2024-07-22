import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jun/block/cart/cart_bloc.dart';
import 'package:flutter_jun/helpers/product.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
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
                      InkWell(
                        onTap: () {
                          context.router.push(ProductRoute(id: id));
                          },
            )
                    ],
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
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 5.0),
               child: Row(
                 children: [
                   Text("${price.toString()}р", style: const TextStyle(
                    fontSize: 18
                   ),),
                   Expanded(child: SizedBox()),
                   BlocBuilder<CartBloc, CartState>(
                    builder:(context, state){
                      List<Product>productsInCart= state.products;
                      int count=0;
                      productsInCart.forEach((e){
                           if(e.id == id){
                            count++;
                           }
                      });
             
             
                       return Row(
                         children: [
                           TextButton(
                    onPressed: (){
                      print("add to cart");
                            context.read<CartBloc>().add(AddOneProductEvent(product: Product(id: id, name: name, hit: false, novetly: false, price: price, rating: rating)));
             
                    }, 
                    child: const Center(child: Text("+", style: TextStyle(fontSize: 20, color: Colors.black), ))),
                    if(count>0)Text(count.toString())
                         ],
                       );  
                    }),
                   
                 ],
               ),
             ),
             ],)
             
            ],
          ),
        )
        ),
    );
  }
}
