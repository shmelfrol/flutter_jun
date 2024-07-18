import 'dart:convert';

import 'package:flutter_jun/block/hit/hit_block.dart';
import 'package:flutter_jun/constants/products.dart';

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

await Future.delayed(Duration(seconds: 3));

return jsonHits;

}






}