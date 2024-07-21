class Product {
  int id;
  String name;
  int price;
  bool hit;
  bool novetly;
  double rating;
  
  Product({
      required this.id, 
      required this.name,
      required this.hit,
      required this.novetly,
      required this.price,
      required this.rating
    });


factory Product.fromJson(Map<String, Object?> jsonMap){
  return Product(
    id: jsonMap['id'] as int,
    name: jsonMap['name'] as String,
    price: jsonMap['price'] as int,
    hit: jsonMap['hit'] as bool,
    novetly: jsonMap['novetly'] as bool,
    rating: jsonMap['rating'] as double
    );
}

Map toJson()=>{
  "id": id,
  "name": name,
  "price": price,
  "hit": hit,
  'novetly': novetly,
  'rating': rating
};

@override
toString() => "id: $id \t name: $name \t price: $price, \t hit: $hit \t novently: $novetly \t rating: $rating";


}

class Cart{
 final List<Product> products;

 Cart({required this.products});
}