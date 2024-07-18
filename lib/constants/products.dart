import 'dart:math';

import 'package:flutter_jun/block/hit/hit_block.dart';



List<Product> generateProducts(int count){
  List<Product> products=[];
     for(int i = 1; i <= count; i++){
      int id =i;
      String name= "product$i";
      String ratingString = (Random().nextDouble()*5).toStringAsFixed(1);
      double rating= double.parse(ratingString);
      bool novetly = Random().nextBool();
      int price = Random().nextInt(100);
        bool hit = Random().nextBool();
        Product product =Product(id: id, name: name, hit: hit, novetly: novetly, price: price, rating: rating);
        products.add(product);
     }
     return products;
}