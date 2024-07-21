part of 'hit_block.dart';


class HitState {
final bool isLoading;
final List<Product> hits;

HitState({
  this.isLoading=false,
  this.hits = const[]
});

HitState copyWith({bool isLoading = false, List<Product>? hits
}){
  return HitState(
      hits: hits ?? this.hits,
      isLoading: isLoading
  );

}


}