import 'dart:convert';

import 'package:flutter_jun/block/hit/hit_block.dart';
import 'package:flutter_jun/constants/products.dart';
import 'package:flutter_jun/helpers/product.dart';

class ProductApi {

final dio= "dio";


Future <String> getHits()async {

List<Product> products=generateProducts(100);

List<Product> hits =[];
products.forEach((p) {
  if(p.hit== true && hits.length<=8){
    hits.add(p);
  }
});

String jsonHits=json.encode(hits);

await Future.delayed(const Duration(seconds: 3));

return jsonHits;

}


Future <String> getCart()async {

List<Product> products=generateProducts(10);
String jsonProducts=json.encode(products);
await Future.delayed(const Duration(seconds: 1));
 return jsonProducts;
}



}