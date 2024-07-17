part of 'hit_block.dart';

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

}

class HitState {
final bool isLoading;
final List<Product> hits;

HitState({
  this.isLoading=false,
  this.hits = const[]
});

HitState copyWith({
  bool isLoading = false,
  List<Product>? hits
}){
  return HitState(
      hits: hits ?? this.hits,
      isLoading: isLoading
  );

}


}