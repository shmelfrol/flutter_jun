

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jun/api/product_api.dart';
import 'package:flutter_jun/helpers/product.dart';

part 'cart_state.dart';
part 'cart_event.dart';



class CartBloc extends Bloc<CartEvent, CartState>{

  CartBloc():super(CartState()){
    on<LoadCartEvent>(_loadCartEvent);
    on<AddOneProductEvent>(_addOneProduct);
  }

  Future<void> _loadCartEvent(LoadCartEvent event, Emitter<CartState> emit)async{

   emit(state.copyWith(isLoading: true, products: [],));
   String jsonProducts=await ProductApi().getCart();
   final decoded = json.decode(jsonProducts);
   List<Product> products=[];
  for(final item in decoded){
    final Product p = Product.fromJson(item);  // создаем объект Person
    products.add(p);
  }

  emit(state.copyWith(isLoading: false, products: products));
  }

  Future<void> _addOneProduct( AddOneProductEvent event,Emitter<CartState> emit)async{
      final Product newproduct= event.product;

      emit(state.copyWith(isLoading: true, products: [...state.products, newproduct],));
  }




}