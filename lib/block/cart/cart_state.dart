part of 'cart_bloc.dart';





class CartState {
  final bool isLoading;
  final List<Product> products;

  CartState({
    this.isLoading=false,
    this.products=const[]
  });


CartState copyWith({bool isLoading = false,List<Product>? products}){
     return CartState(
         products: products ?? this.products,
         isLoading: isLoading
     );
}

addOneProduct({required Product product}){
  products.add(product);
}

}